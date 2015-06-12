package com.ifwd.fwdhk.util;



import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
/*
import org.apache.tika.config.TikaConfig;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MediaType;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;
import org.codehaus.jackson.type.TypeReference;*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import com.ifwd.fwdhk.exception.ValidationException;
import com.ifwd.fwdhk.exception.ValidationUtilsException;

import static com.ifwd.fwdhk.exception.ErrorCodes.ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE;

/**
 * The Class ValidationErrorUtils which contains various methods pertaining to
 * processing validation errors
 */
public class ValidationUtils {

	/** The Constant LOGGER for logging events onto the console */
	private static final Logger LOGGER = LoggerFactory.getLogger(ValidationUtils.class);



	/*
	public String convertToJsonString(Object target, String errorMessage, String errorCode, String errorField) {

		String jsonString = null;
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("dd-MMM-yyyy"));
		try {
			jsonString = mapper.writeValueAsString(target);
			JsonNode jsonNode = mapper.readTree(jsonString);

			ObjectNode objectNode = (ObjectNode) jsonNode;
			objectNode.put("errorMessage", errorMessage);
			objectNode.put("errorCode", errorCode);
			objectNode.put("errorField", errorField);
			jsonString = mapper.writeValueAsString(objectNode);

		} catch (JsonGenerationException jsonGenerationException) {

			jsonGenerationException.printStackTrace();

			throw new ValidationUtilsException(ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE);

		} catch (JsonMappingException jsonMappingException) {

			jsonMappingException.printStackTrace();

			throw new ValidationUtilsException(ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE);

		} catch (IOException ioException) {

			ioException.printStackTrace();

			throw new ValidationUtilsException(ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE);
		}

		return jsonString;
	}

	
	public ObjectNode removeAdditionalData(ObjectNode objectNode) {

		if (objectNode != null) {
			objectNode.remove("pkey");
			objectNode.remove("createdOn");
			objectNode.remove("createdBy");
			objectNode.remove("lastUpdatedOn");
			objectNode.remove("lastUpdatedBy");
			objectNode.remove("version");
			objectNode.remove("deleted");
			objectNode.remove("uploadSession");

			return objectNode;
		} else {
			return objectNode;
		}
	}

	



	public String getErrorMessageFromBindingResult(BindingResult result) {

		if (result == null) {

			throw new ValidationUtilsException(ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE);
		}

		List<ObjectError> objectErrorsList = result.getAllErrors();
		if (objectErrorsList != null) {
			if (objectErrorsList.size() != 0) {

				ObjectError objectError = objectErrorsList.get(0);

				return objectError.getCode();
			}
		}
		return null;
	}

	
*/
    // both are null return true
    public static boolean stringCompareToIgnoreCase(String str1, String str2){
        boolean rtn = false;
                
        if(str1 == null && str2 == null){
            rtn = true;
        }else if (str1 == null && str2 != null){
            rtn = false;
        }else if (str1 != null && str2 == null){
            rtn = false;
        }else{
            if(str1.compareToIgnoreCase(str2) == 0){
                rtn = true;
            }else{
                rtn = false;
            }
        }
                            
        return rtn;
    }
    public static String getRelationshipById(String idA1, String idA2){
        String relationship = "";
                
        if(stringCompareToIgnoreCase(idA1, idA2)){
            relationship = "SE";    // self
        }else{
            relationship = "RF";    // relation or friend 
        }
                
        return relationship;
    }	

}
