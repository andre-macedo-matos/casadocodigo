package org.casadocodigo.loja.infra;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;

@Component
@Profile("dev")
public class FileSaver implements Saver {

	@Autowired
	AmazonS3Client s3;

	public String write(String baseFolder, MultipartFile file) {
		try {
			s3.putObject(baseFolder, file.getOriginalFilename(), file.getInputStream(), new ObjectMetadata());

			return "http://localhost:9444/s3/" + baseFolder + "/" + file.getOriginalFilename() + "?noAuth=true";
		} catch (IOException | AmazonClientException e) {
			throw new RuntimeException(e);
		}
	}

}
