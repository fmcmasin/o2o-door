package com.o2o.door.common.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;

public class JSONTools {
	private final static ObjectMapper _mapper = new ObjectMapper();

	/**
	 * 获取泛型的Collection Type
	 * 
	 * @param collectionClass
	 *            泛型的Collection
	 * @param elementClasses
	 *            元素类
	 * @return JavaType Java类型
	 * @since 1.0
	 */
	private static JavaType getCollectionType(Class<?> collectionClass,
			Class<?>... elementClasses) {
		return _mapper.getTypeFactory().constructParametricType(
				collectionClass, elementClasses);
	}

	/**
	 * 
	 * @param jsonString json字符串
	 * @param type json转换的类型
	 * @return List 集合
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static <T> List<T> JsonForModel(String jsonString, Class<T> type)
			throws JsonParseException, JsonMappingException, IOException {
		JavaType javaType =getCollectionType(ArrayList.class,
				type);
		return _mapper.readValue(jsonString, javaType);
	}
}
