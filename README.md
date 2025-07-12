Setup Of the Project API Test in Pycharm 
      1. Create a Project in Pycharm with any name say: APITest
      2. Go to Settings, select Project and click Python Interpreter
      3. Install the following packages
          a) robotframework
          b) robotframework-requests
          c) robotframework-jsonlibrary
          d) requests
          e) jsonpath-rw
          f) jsonpath-rw-ext
     4. To execue the test file run the following command in terminal
            robot TC1_PostGetRequest.robot


Project Structure:
  APITest
    TC1_PostGetRequest.robot (contains both test cases 1. Vreate user entry and verify that is created is numerical, 2. Verify that the first entry status is either active or Inactive)
