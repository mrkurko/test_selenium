#!/usr/bin/ruby

##############################
##########  README  ##########  
##############################
#Instalar:
#gem install selenium-webdriver -v 3.12.0
#gem install fileutils
#
#Se debe configurar el webdriver de Google Chrome
#
#Constantes
#DRIVER_PATH 		= Path to the webdriver for Google Chrome
#SCREENSHOT_PATH	= Path to screenshots Folder

require 'rubygems'
require 'fileutils'
require "selenium-webdriver"




## CONSTANTES
DRIVER_PATH = "/usr/bin/chromedriver"
SCREENSHOT_PATH = "/var/www/rails_apps/test_selenium/screenshots"



Selenium::WebDriver::Chrome.driver_path = DRIVER_PATH

wait = Selenium::WebDriver::Wait.new(:timeout => 20)
browser = Selenium::WebDriver.for :chrome

browser.get("http://exercises.fdvs.com.ar/semisenior.html")
sleep 3


##################################################
#################  Anwser No. 1  #################
##################################################
answer1 = wait.until {
	element = browser.find_element(id: "answer1")
	element if element.displayed?
}
answer1.location_once_scrolled_into_view
answer1.send_keys browser.title
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer1.png'))
p 'Answer1 Pass'
sleep 3


##################################################
#################  Anwser No. 2  #################
##################################################
text1 = wait.until {
	element = browser.find_element(xpath: "//html//li[2]/b[1]")
	element if element.displayed?
}
text1.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer2.png'))

answer2 = wait.until {
	element = browser.find_element(id: "name")
	element if element.displayed?
}
answer2.location_once_scrolled_into_view
answer2.send_keys text1.text.strip
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer2-1.png'))
p 'Answer2 Pass'
sleep 3


##################################################
#################  Anwser No. 3  #################
##################################################
text2 = wait.until {
	element = browser.find_element(xpath: "//html//li[3]/b[1]")
	element if element.displayed?
}
text2.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer3.png'))

dropdown = wait.until {
	element = browser.find_element(id: "occupation")
	element if element.displayed?
}
dropdown.location_once_scrolled_into_view
answer3 = Selenium::WebDriver::Support::Select.new(dropdown)
answer3.select_by(:text, text2.text.strip)
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer3-1.png'))
p 'Answer3 Pass'
sleep 3


##################################################
#################  Anwser No. 4  #################
##################################################
answer4 = wait.until {
	element = browser.find_elements(css: "span.blackbox")
}
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer4.png'))

slot4 = wait.until {
	element = browser.find_element(id: "answer4")
	element if element.displayed?
}
slot4.location_once_scrolled_into_view
slot4.send_keys answer4.length
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer4-1.png'))
p 'Answer4 Pass'
sleep 3


##################################################
#################  Anwser No. 5  #################
##################################################
text3 = wait.until {
	element = browser.find_element(xpath: "//html//li[5]/b[1]")
	element if element.displayed?
}
text3.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer5.png'))
value = text3.text.gsub(" ","").strip.downcase
answer5 = wait.until {
	element = browser.find_element(xpath: "//a[@id='#{value}']")
	element if element.displayed?
}
answer5.location_once_scrolled_into_view
answer5.click
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer5-1.png'))
p 'Answer5 Pass'
sleep 3


##################################################
#################  Anwser No. 6  #################
##################################################
text4 = wait.until {
	element = browser.find_element(id: "redbox")
	element if element.displayed?
}
text4.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer6.png'))

answer6 = wait.until {
	element = browser.find_element(id: "answer6")
	element if element.displayed?
}
answer6.location_once_scrolled_into_view
answer6.send_keys text4.attribute("class")
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer6-1.png'))
p 'Answer6 Pass'
sleep 3


##################################################
#################  Anwser No. 7  #################
##################################################
text5 = wait.until {
	element = browser.find_element(xpath: "//html//li[7]/b[1]")
	element if element.displayed?
}
text5.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer7.png'))

answer7 = wait.until {
	element = browser.find_element(xpath: "//input[@value='#{text5.text.strip}']")
	element if element.displayed?
}
answer7.location_once_scrolled_into_view
answer7.click
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer7-1.png'))
p 'Answer7 Pass'
sleep 3


##################################################
#################  Anwser No. 8  #################
##################################################
text6 = wait.until {
	element = browser.find_element(id: "redbox")
	element if element.displayed?
}
text6.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer8.png'))

answer8 = wait.until {
	element = browser.find_element(id: "answer8")
	element if element.displayed?
}
answer8.location_once_scrolled_into_view
answer8.send_keys text6.text.strip
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer8-1.png'))
p 'Answer8 Pass'
sleep 3



##################################################
#################  Anwser No. 9  #################
##################################################
text7 = wait.until {
	element = browser.find_element(xpath: "/html[1]/body[1]/span[#{answer4.length + 2}]")
	element if element.displayed?
}
text7.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer9.png'))
v1 = text7.attribute("style").split(" ")
v2 = v1[1].gsub(";","")

answer9 = wait.until {
	element = browser.find_element(id: "answer9")
	element if element.displayed?
}
answer9.location_once_scrolled_into_view
answer9.send_keys v2.strip.downcase
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer9-1.png'))
p 'Answer9 Pass'
sleep 3



##################################################
#################  Anwser No. 10  ################
##################################################
begin
	text8 = wait.until {
		element = browser.find_element(id: "IAmHere")
		element if element.displayed?
	}
	value = "YES"
rescue Selenium::WebDriver::Error::TimeOutError
	value = "NO"
end

answer10 = wait.until {
	element = browser.find_element(id: "answer10")
	element if element.displayed?
}
answer10.location_once_scrolled_into_view
answer10.send_keys value
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer10.png'))
p 'Answer10 Pass'
sleep 3


##################################################
#################  Anwser No. 11  ################
##################################################
begin
	text9 = wait.until {
		element = browser.find_element(id: "purplebox")
		element if element.displayed?
	}
	v1 = text9.attribute("style").split(" ")

	value1 = v1.length == 6 ? "YES" : "NO"

	answer11 = wait.until {
		element = browser.find_element(id: "answer11")
		element if element.displayed?
	}
	answer11.location_once_scrolled_into_view
	answer11.send_keys value1
	browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer11.png'))
rescue
end
p 'Answer11 Pass'
sleep 3


##################################################
#################  Anwser No. 12  ################
##################################################
text10 = wait.until {
	element = browser.find_element(xpath: "/html[1]/body[1]/p[2]/a[1]")
	element if element.displayed?
}
text10.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer12.png'))
text10.click

newlink = wait.until {
	element = browser.find_element(xpath: "/html[1]/body[1]/a[4]")
	element if element.displayed?
}
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer12-1.png'))
newlink.click
p 'Answer12 Pass'
sleep 3


##################################################
#################  Anwser No. 13  ################
##################################################
alert1 = browser.switch_to.alert
alert1.accept
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer13.png'))
p 'Answer13 Pass'
sleep 3


##################################################
#################  Anwser No. 14  ################
##################################################
text14 = wait.until {
	element = browser.find_element(id: "submitbutton")
	element if element.displayed?
}
text14.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer14.png'))
text14.click
p 'Answer14 Pass'
sleep 3


##################################################
#################  Anwser No. 15  ################
##################################################
text15 = wait.until {
	element = browser.find_element(id: "checkresults")
	element if element.displayed?
}
text15.location_once_scrolled_into_view
browser.save_screenshot(File.join(SCREENSHOT_PATH,'answer15.png'))
text15.click
p 'Answer14 Pass'
sleep 3



p 'termino'

sleep 300



