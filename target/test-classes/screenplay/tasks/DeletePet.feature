Feature: Task - Eliminar mascota

Scenario:
  Given url karate.get('baseUrl') + '/pet/' + petId
  When method delete
  Then status 200 || status 404
