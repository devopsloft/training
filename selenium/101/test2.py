#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


def main():
    SELENIUM_HUB = 'http://localhost:4444/wd/hub'

    chrome_driver = webdriver.Remote(
      command_executor=SELENIUM_HUB,
      desired_capabilities=DesiredCapabilities.CHROME,
    )

    firefox_driver = webdriver.Remote(
      command_executor=SELENIUM_HUB,
      desired_capabilities=DesiredCapabilities.FIREFOX,
    )
    app_url = 'http://www.devopsloft.io'

    try:
        for driver in [chrome_driver, firefox_driver]:

            print("==== " + str(driver.name) + " ====")
            driver.get(app_url)

            print("Checking Title...")
            assert driver.title == "XXXX", 'title is wrong'

            print("Tests Passed Successfully")
    finally:
        for driver in [chrome_driver, firefox_driver]:
            driver.quit()


if __name__ == '__main__':
    main()
