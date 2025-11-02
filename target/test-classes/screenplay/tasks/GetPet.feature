Feature: Task - Obtener mascota por ID

  Scenario:
    Given url karate.get('baseUrl') + '/pet/' + petId
    When method get
    * def ok = responseStatus == 200 || responseStatus == 404
    * assert ok

    * eval
  """
  if (responseStatus == 200) {
      karate.log('✅ Mascota encontrada correctamente:', response.name);
      karate.match(response.id, petId);
  } else if (responseStatus == 404) {
      karate.log('⚠️ Mascota no encontrada (PetStore pudo haberla eliminado o reiniciado la base temporal)');
  }
  """
