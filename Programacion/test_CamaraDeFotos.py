
import pytest
from CamaraDeFotos import CamaraFotografica

@pytest.mark.parametrize("memoria, bateriaInicial, fotosTomadas, bateriaFinal, fotosTotal, mensajeError", [
    (100, 100, 1, 90, 1, None),
    (100, 50, 5, 0, 5, None),
    (100, 20, 3, 0, 2, "Bateria agotada"),
    (2, 50, 5, 30, 2, "Se termino el espacio en memoria")
])
def test_tomar_foto(memoria, bateriaInicial, fotosTomadas, bateriaFinal, fotosTotal, mensajeError):
    camara = CamaraFotografica("Canon", memoria)
    camara._CamaraFotografica__bateria = bateriaInicial
    mensaje = None
    
    for _ in range(fotosTomadas):
        mensaje = camara.tomarFoto()
    
    assert camara.get_bateria() == bateriaFinal
    assert camara.get_fotos() == fotosTotal
    assert mensaje == mensajeError

@pytest.mark.parametrize("bateriaInicial, bateriaFinal, mensajeError", [
    (50, 100, None),
    (0, 100, None),
    (100, 100, "La bateria no necesita cargarse")
])
def test_cargar_bateria(bateriaInicial, bateriaFinal, mensajeError):
    camara = CamaraFotografica("Kodak", 500)
    camara._CamaraFotografica__bateria = bateriaInicial
    
    mensaje = None
    mensaje = camara.cargarBateria()
    
    assert camara.get_bateria() == bateriaFinal
    assert mensaje == mensajeError

@pytest.mark.parametrize("nivelZoom, resultadoEsperado, error", [
    (5, 5, None),
    (15, None, ValueError),
    (0, None, ValueError), 
])
def test_set_zoom(nivelZoom, resultadoEsperado, error):
    camara = CamaraFotografica("Sony", 200)

    if error:
        with pytest.raises(error):
            camara.setZoom(nivelZoom)
    else:
        camara.setZoom(nivelZoom)
        assert camara.get_zoom() == resultadoEsperado