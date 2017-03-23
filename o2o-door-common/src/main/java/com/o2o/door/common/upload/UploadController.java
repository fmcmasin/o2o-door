package com.o2o.door.common.upload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.o2o.door.common.copy.DBSession;
import com.o2o.door.common.copy.DataExcel;
import com.o2o.door.common.copy.DeleteFileUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {
	private Logger LOG = Logger.getLogger(UploadController.class);

	private HashMap<String, String> TypeMap = new HashMap<String, String>();

	// 设置文件允许上传的类型
	public UploadController() {
		TypeMap.put("image", "gif,jpg,jpeg,png,bmp");
		TypeMap.put("flash", "swf,flv");
		TypeMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		TypeMap.put("file", "doc,docx,xls,xlsx,ppt,pptx,htm,html,txt,dwg,pdf");
	}

	// 设置文件上传大小
	public long fileSize = 3 * 1024 * 1024;

	/**
	 * 文件上传
	 * 
	 * @param file
	 * @param request
	 * @return message: -1 没有文件上传 0 上传成功 1 上传失败 2 文件超过上传大小 3 文件格式错误 4 上传文件路径非法 5
	 *         上传目录没有写权限
	 * 
	 * 
	 */
	@RequestMapping("/imageUpload")
	public void imageUpload(
			@RequestParam("o2o_file_upload") CommonsMultipartFile file,
			@RequestParam(required = false) String filePre,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.info("file name is :" + file.getOriginalFilename());
		String path = request.getServletContext().getRealPath("/uploadImages")
				+ "\\";
		if (!file.isEmpty()) {

			// 当文件超过设置的大小时，则不运行上传
			if (file.getSize() > fileSize) {
				backInfo(response, false, 2, "");
				return;
			}
			// 获取文件名后缀
			String OriginalFilename = file.getOriginalFilename();
			String fileSuffix = OriginalFilename.substring(
					OriginalFilename.lastIndexOf(".") + 1).toLowerCase();

			// String fileSuffix="jpeg";

			// 判断该类型的文件是否在允许上传的文件类型内
			if (!Arrays.asList(TypeMap.get("image").split(",")).contains(
					fileSuffix)) {
				backInfo(response, false, 3, "");
				return;
			}
			if (!ServletFileUpload.isMultipartContent(request)) {
				backInfo(response, false, -1, "");
				return;
			}
			// 检查上传文件的目录
			File uploadDir = new File(path);
			if (!uploadDir.isDirectory()) {
				if (!uploadDir.mkdir()) {
					backInfo(response, false, 4, "");
					return;
				}
			}
			// 是否有上传的权限
			if (!uploadDir.canWrite()) {
				backInfo(response, false, 5, "");
				return;
			}

			// 新文件名
			String newname = "";
			if (null != filePre) {
				newname += filePre;// 对应模块上传的文件名前缀
			}
			newname += UUID.randomUUID() + "." + fileSuffix;

			try {

				// 创建文件
				File saveFile = new File(path, newname);
				// 保存文件
				file.transferTo(saveFile);
				// FileTranser.saveFielByFileName(file, uploadPath, newname);
				backInfo(response, true, 0, newname);
			} catch (Exception e) {
				LOG.error(e.getMessage(), e);
				backInfo(response, false, 1, "");
				return;
			}
		} else {
			backInfo(response, false, -1, "");
			return;
		}

	}

	/**
	 * 返回json信息
	 * 
	 * @param response
	 * @param flag
	 * @param message
	 * @param fileName
	 */
	private void backInfo(HttpServletResponse response, boolean flag,
			int message, String fileName) {
		String json = "";
		// json=fileName;
		if (flag) {
			json = "{ \"status\": \"success";
		} else {
			json = "{ \"status\": \"error";
		}
		json += "\",\"fileName\": \"" + fileName + "\",\"message\": \""
				+ message + "\"}";
		try {
			// response.setContentType("text/javascript");
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(json);
			LOG.info(json.toString());
		} catch (IOException e) {
			LOG.error(e.getMessage(), e);
		}
	}

	/**
	 * 下载文件
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/downloadFile")
	public void download(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		//获取上下文路劲
		String realPath = request.getServletContext()
				.getRealPath("/downexcel/");
		String fileName = request.getParameter("excelTemp");
		try {
			File f = new File(realPath, fileName);
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ fileName);
			response.setHeader("Content-Length", String.valueOf(f.length()));
			in = new BufferedInputStream(new FileInputStream(f));
			out = new BufferedOutputStream(response.getOutputStream());
			byte[] data = new byte[1024];
			int len = 0;
			while (-1 != (len = in.read(data, 0, data.length))) {
				out.write(data, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}

	}

	// 上传excel表格
	@ResponseBody
	@RequestMapping("/excelUpload")
	public Map<String, String> excelUpload(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultiValueMap<String, MultipartFile> multiFileMap = multipartRequest
				.getMultiFileMap();
		// 获取到存储Excel表格的文件地址
		String path = request.getServletContext().getRealPath("/excelupload")
				+ "\\";
		// 新文件名
		String newname = "";

		Map<String, String> map = new HashMap<String, String>();

		try {
			// 遍历request中的文件集合
			for (String key : multiFileMap.keySet()) {
				List<MultipartFile> MultipartFiles = multiFileMap.get(key);
				for (MultipartFile file : MultipartFiles) {
					LOG.info("file name is :" + file.getOriginalFilename());

					if (!file.isEmpty()) {

						// 获取文件名后缀
						String OriginalFilename = file.getOriginalFilename();

						String fileSuffix = OriginalFilename.substring(
								OriginalFilename.lastIndexOf(".") + 1)
								.toLowerCase();
						// UUID.randomUUID()自动生成一个不重复的数字。
						newname += UUID.randomUUID() + "." + fileSuffix;

						try {
							// 创建文件
							File saveFile = new File(path, newname);

							// 保存文件
							file.transferTo(saveFile);

							// 成功则返回正确的文件路径，失败则返回null
							map.put("path", newname);
							return map;
						} catch (Exception e) {
							LOG.error(e.getMessage(), e);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}
	
	/**
	 * 获取上传的excel表格的内容并删除Excel表格
	 * @throws Exception 
	 * */
	public <T> Map<String, Object> excelUploadList(HttpServletRequest request,
			String filePre,Class<T> type) throws Exception {
		Map<String, Object> ms = new HashMap<String, Object>();
		int success = 0;
		int fail = 0;
			String path = request.getServletContext().getRealPath(
					"/"+DBSession.getstoragexcelUrl())
					+ "\\";
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultiValueMap<String, MultipartFile> multiFileMap = multipartRequest
					.getMultiFileMap();
			for (String key : multiFileMap.keySet()) {
				List<MultipartFile> MultipartFiles = multiFileMap.get(key);
				for (MultipartFile file : MultipartFiles) {
					if (!file.isEmpty()) {
						// 当文件超过设置的大小时，则不运行上传
						if (file.getSize() > fileSize) {
							fail++;
							continue;
						}
						// 获取文件名后缀
						String OriginalFilename = file.getOriginalFilename();
						String fileSuffix = OriginalFilename.substring(
								OriginalFilename.lastIndexOf(".") + 1)
								.toLowerCase();

						// 判断该类型的文件是否在允许上传的文件类型内
						if (!Arrays.asList(TypeMap.get("file").split(","))
								.contains(fileSuffix)) {
							fail++;
							continue;
						}
						
						if (!ServletFileUpload.isMultipartContent(request)) {
							fail++;
							continue;
						}
						// 检查上传文件的目录
						File uploadDir = new File(path);
						if (!uploadDir.isDirectory()) {
							if (!uploadDir.mkdir()) {
								fail++;
								continue;
							}
						}
						// 是否有上传的权限
						if (!uploadDir.canWrite()) {
							fail++;
							continue;
						}

						// 新文件名
						String newname = "";
						if (null != filePre) {
							newname += filePre;// 对应模块上传的文件名前缀
						}
						newname += UUID.randomUUID() + "." + fileSuffix;

						// 创建文件
						File saveFile = new File(path, newname);
						// 保存文件
						file.transferTo(saveFile);
						ms=new DataExcel().getDataExcelCellList(path+newname,type);
						DeleteFileUtil.deleteFile(path+newname);
						success++;
					} else {
						fail++;
					}
				}
			}
		ms.put("success", success);
		ms.put("fail", fail);
		return ms;
	}
}