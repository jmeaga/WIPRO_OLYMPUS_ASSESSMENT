package com.example.demo.model;


import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "app_details")
public class AppDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer appId;

    private String appName;
    private String description;
    private LocalDate releaseDate;
    
	private String version;
    private Double rating;
    private String genre;
   
    @Transient
    private Integer downloadCount;


    // Getters and Setters
    public Integer getAppId() { return appId; }
    public void setAppId(Integer appId) { this.appId = appId; }
    public String getAppName() { return appName; }
    public void setAppName(String appName) { this.appName = appName; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public LocalDate getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Integer getDownloadCount() { return downloadCount; }
	public void setDownloadCount(Integer downloadCount) { this.downloadCount = downloadCount; }

    public String getVersion() { return version; }
    public void setVersion(String version) { this.version = version; }
    public Double getRating() { return rating; }
    public void setRating(Double rating) { this.rating = rating; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
}
