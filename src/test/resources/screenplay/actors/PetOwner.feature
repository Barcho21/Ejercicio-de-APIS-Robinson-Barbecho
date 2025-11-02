Feature: Definición del actor principal (dueño de mascotas)

Scenario:
  * def Actor =
  """
  {
    "name": "Usuario QA",
    "role": "Pet Owner"
  }
  """
  * print 'Actor definido:', Actor
  * configure headers = { 'Content-Type': 'application/json' }
