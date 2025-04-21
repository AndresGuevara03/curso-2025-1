#include <stdio.h>
#include <stdlib.h>
#include <cjson/cJSON.h>

cJSON* procesarJSON(cJSON* entrada){
  cJSON* respuesta = cJSON_CreateObject();
  cJSON* mensaje = cJSON_GetObjectItem(entrada, "mensaje");
  if(mensaje != NULL){
    cJSON_AddItemToObject(respuesta, "mensaje_original", cJSON_Duplicate(mensaje, 1));
  }
  return respuesta;
}

int main(int numArgs, char** args){
  char* json_string = "{\"mensaje\": \"Este es el mensaje original\"}";
  cJSON* objJsonEntrada = cJSON_Parse(json_string);
  if(objJsonEntrada == NULL){
    printf("Erro en la codificacion del JSON\r\n");
    return (EXIT_FAILURE);
  }
  cJSON* respuesta = procesarJSON(objJsonEntrada);
  char* cadena = cJSON_Print(respuesta);
  printf("El JSON es: %s \r\n", cadena);
  cJSON_Delete(respuesta);
  cJSON_Delete(objJsonEntrada);
  return (EXIT_SUCCESS);
}
