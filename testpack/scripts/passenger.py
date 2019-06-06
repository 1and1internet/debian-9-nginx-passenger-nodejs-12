#!/usr/bin/env python3

import unittest
from testpack_helper_library.unittests.dockertests import Test1and1Common


class Test1and1Image(Test1and1Common):
    # <tests to run>

    def test_welcome_page(self):
        driver = self.getChromeDriver()
        driver.get(Test1and1Common.endpoint)
        self.assertTrue(
            driver.page_source.find('Welcome to your nodejs 12 environment') > -1,
            msg="No success for welcome page"
        )

    # </tests to run>

if __name__ == '__main__':
    unittest.main(verbosity=1)
