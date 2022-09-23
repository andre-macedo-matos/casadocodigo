package org.casadocodigo.loja.infra;

import org.springframework.web.multipart.MultipartFile;

public interface Saver {
	
	String write(String baseFolder, MultipartFile file);

}
