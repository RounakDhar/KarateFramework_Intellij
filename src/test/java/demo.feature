Feature: Validation of GET request
  Background:
    # url

  Scenario: User is able to Get the Response
    Given url 'https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all'
    When method GET
    Then status 200
    * print response

  Scenario: verify delayed response
    Given url 'https://reqres.in/api/users'
    And param page = 2
    When method GET
    Then status 200
    * print response

  Scenario: User is able to Post the Request and Get the Response
    Given url 'https://reqres.in/api/users'
    * def request_payload = {"name": "Harry","job": "Student"}
    And request request_payload
    When method POST
    Then status 201
    * print response
    * def responseName = response.name
    * print responseName

  @sanity
  Scenario: User is able to Login sucessfully with valid credential
    Given url 'https://reqres.in/api/login'
    * def request_payload = {"email": "eve.holt@reqres.in","password": "cityslicka"}
    And request request_payload
    When method POST
    Then status 200
    * def token = response.token
    * print 'login user token is: ', token

  Scenario: User is able to Login sucessfully with valid credential
    Given url 'https://reqres.in/api/login'
    * def request_payload =
  """
  {
  "email": "eve.holt@reqres.in",
  "password": "cityslicka"
  }
  """
    And request request_payload
    When method POST
    Then status 200
    * def token = response.token
    * print 'login user token is: ', token

  Scenario: User is able to Login sucessfully with Invalid credential
    Given url 'https://reqres.in/api/login'
    * def request_payload = {"email": "eve.holt@reqres.in"}
    And request request_payload
    When method POST
    Then status 400
    * print response.error

  Scenario Outline: User is able to Post the Request and Get the Response using Outline
    Given url 'https://reqres.in/api/users'
    * def request_payload = {"name": <Name>,"job": <Job>}
    And request request_payload
    When method POST
    Then status 201
    * print response
    * def responseName = response.name
    * print responseName

    Examples:
      | Name    | Job      |
      | Rakesh  | Engineer |
      | Vikash  | Student  |

  Scenario Outline: User is able to Post the Request and Get the Response using Outline name: <Name> and job: <Job>
    Given url 'https://reqres.in/api/users'
    * def request_payload = {"name": <Name>,"job": <Job>}
    And request request_payload
    When method POST
    Then status 201
    * print response
    * def responseName = response.name
    * print responseName

    Examples:
      | Name    | Job      |
      | Rakesh  | Engineer |
      | Vikash  | Student  |

  Scenario: User is able to Post the Request and Get the Response using Read from Other File
    Given url 'https://reqres.in/api/users'
    # * def request_payload = {"name": <Name>,"job": <Job>}
    * def request_payload = read('requestPayload.json')
    *  request_payload.name = "Harry"
    *  request_payload.job = "Student"
    And request request_payload
    When method POST
    Then status 201
    * print response

  Scenario: User is able to Post the Request and Get the Response using Read from Other File in Different Location
    Given url 'https://reqres.in/api/users'
    * def request_payload = read('../requestPayload_diffLoc.json')
    *  request_payload.name = "Harry"
    *  request_payload.job = "Student"
    And request request_payload
    When method POST
    Then status 201
    * print response

  Scenario: User is able to Post the Request and Get the Response using Read from Other File in Different Location Outside Folder
    Given url 'https://reqres.in/api/users'
    * def request_payload = read('../../main/java/requestPayload_diffLocFolder.json')
    *  request_payload.name = "Harry"
    *  request_payload.job = "Student"
    And request request_payload
    When method POST
    Then status 201
    * print response

  Scenario Outline: User is able to Post the Request and Get the Response using Read from Other File in Scenario Outline
    Given url 'https://reqres.in/api/users'
    * def request_payload = read('../../main/java/requestPayload_diffLocFolder.json')
    *  request_payload.name = '<Name>'
    *  request_payload.job = '<Job>'
    And request request_payload
    When method POST
    Then status 201
    * print response

    Examples:
      | Name    | Job      |
      | Rakesh  | Engineer |
      | Vikash  | Student  |

  Scenario Outline: User is able to Post the Request and Get the Response using Read from Other File and Assert
    Given url 'https://reqres.in/api/users'
    * def request_payload = read('../../main/java/requestPayload_diffLocFolder.json')
    *  request_payload.name = '<Name>'
    *  request_payload.job = '<Job>'
    And request request_payload
    When method POST
    Then status 201
    * print response
    Then match response.name == '<Name>'
    #Then match response.name == '<Job>'

    Examples:
      | Name    | Job      |
      | Rakesh  | Engineer |
      | Vikash  | Student  |



