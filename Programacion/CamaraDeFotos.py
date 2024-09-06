class CamaraFotografica:
    def __init__(self, marca, memoriaCapacidad):
        self.__marca = marca
        self.__memoriaCapacidad = memoriaCapacidad
        self.__bateria = 100
        self.__fotos = 0
        self.__zoom = 1
    
    def get_bateria(self):
        return self.__bateria

    def get_fotos(self):
        return self.__fotos
    
    def get_zoom(self):
        return self.__zoom
    
    def tomarFoto(self):
        if self.__bateria <= 0:
            return "Bateria agotada"
        if self.__fotos < self.__memoriaCapacidad:
            self.__fotos += 1
            self.__bateria -= 10
        else:
            return "Se termino el espacio en memoria"
    
    def cargarBateria(self):
        if self.__bateria != 100:
            self.__bateria = 100
        else:
            return "La bateria no necesita cargarse"
    
    def setZoom(self, nivelZoom):
        if 1 <= nivelZoom <= 10:
            self.__zoom = nivelZoom
        else:
            raise ValueError("Nivel de zoom invalido")
    
    def __str__(self):
        return f"La camara {self.__marca} tiene {self.__fotos} fotos cargadas y le queda {self.__bateria}% de bateria" 


