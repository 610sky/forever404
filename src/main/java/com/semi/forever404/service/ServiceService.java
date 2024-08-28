package com.semi.forever404.service;

import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Service;

@Service
public class ServiceService {
	
	public String getImgUrl(String title) throws InterruptedException {
		
		// 1. WebDriver와 ChromeDriver 설정
		// 프로젝트 폴더 기준으로 chromedirver.exe 파일의 위치를 작성
		System.setProperty("webdriver.chrome.driver", "driver/chromedriver.exe");
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		
		// 2. 웹 페이지 접속
		String baseUrl = "https://www.google.com/";
		driver.get(baseUrl);
		String searchKeyword=title;
		
		WebElement search = driver.findElement(By.className("gLFyf"));
		// 원하는 값 입력하기
		search.sendKeys(searchKeyword);
		search.sendKeys(Keys.ENTER);
	
		Thread.sleep(1500);
		
		List<WebElement> tmp = driver.findElements(By.cssSelector("#hdtb-sc > div > div.qogDvd > div.crJ18e > div > div"));
		
		for(WebElement w : tmp) {
			if(w.getText().equals("이미지")) {
				w.click();
				break;
			}
		}
		Thread.sleep(1000);
		WebElement tmp2 = driver.findElement(By.xpath("//*[@id=\"rso\"]/div/div/div[1]/div/div/div[1]/div[2]/h3/a/div/div/div/g-img"));
		tmp2.click();
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(1500));
		WebElement popupElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"Sva75c\"]/div[2]/div[2]/div/div[2]/c-wiz/div/div[3]/div[1]/a")));
		
		WebElement imageElement = popupElement.findElement(By.tagName("img")); // 팝업 내에서 이미지 요소 찾기
        String imageSrc = imageElement.getAttribute("src"); // 이미지의 src 속성 값 가져오기
        System.out.println("Image URL: " + imageSrc);
        
        return imageSrc;
	}
}
