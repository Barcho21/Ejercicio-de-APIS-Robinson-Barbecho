Feature: Interaction - Enviar POST para crear mascota

Scenario:
  * def body =
  """
  {
    "id": #(petId),
    "name": "#(name)",
    "status": "#(status)"
  }
  """
  Given url karate.get('baseUrl') + '/pet'
  And request body
  When method post
  Then status 200
  * match response.name == name
  * print 'Mascota creada:', response.name
