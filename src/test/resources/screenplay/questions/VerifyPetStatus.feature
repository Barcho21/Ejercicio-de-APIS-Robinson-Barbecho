Feature: Question - Verificar estado de mascota

  Scenario:
    Given url karate.get('baseUrl') + '/pet/' + petId
    When method get
    Then assert responseStatus == 200 || responseStatus == 404

    * eval
  """
  if (responseStatus == 200) {
      karate.log('Estado actual de la mascota:', response.status);
  } else if (responseStatus == 404) {
      karate.log('Mascota no encontrada (API PetStore pudo haberse reiniciado o eliminado los datos temporales)');
  }
  """
