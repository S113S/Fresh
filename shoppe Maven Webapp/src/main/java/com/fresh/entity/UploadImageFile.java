package com.fresh.entity;

import org.springframework.web.multipart.MultipartFile;

public class UploadImageFile {
	MultipartFile image;

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "UploadImagefile [image=" + image + "]";
	}
}
