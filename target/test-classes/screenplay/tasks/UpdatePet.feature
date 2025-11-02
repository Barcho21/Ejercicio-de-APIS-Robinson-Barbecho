Feature: Task - Actualizar mascota

  Scenario:
    * def newName = name + '-upd'
    * def body =
  """
  {
    "id": #(petId),
    "name": "#(newName)",
    "status": "#(status)"
  }
  """
    Given url karate.get('baseUrl') + '/pet'
    And request body
    When method put
    Then status 200
    * print '✅ Mascota actualizada correctamente:', newName
    * match response.name == newName
