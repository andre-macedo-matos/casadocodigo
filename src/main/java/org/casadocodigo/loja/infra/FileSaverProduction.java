package org.casadocodigo.loja.infra;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Profile("prod")
public class FileSaverProduction implements Saver {

	public String write(String baseFolder, MultipartFile file) {
		return "http://localhost:9444/s3/" + baseFolder + "/" + file.getOriginalFilename() + "?noAuth=true";
	}

}
