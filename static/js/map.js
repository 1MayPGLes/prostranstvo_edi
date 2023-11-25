let center = [55.752053479087934,37.61903642835505]
let izm = [55.78937290476116,37.792628747732934]
let baum = [55.76593879222048,37.68554204101422]
let bab = [55.881144363411515,37.641096266588605]
let pres = [55.761166152756594,37.57841959629285]
let dib = [59.905459014341055,30.474763647290807]
let lig = [59.92799171584363,30.358593503928564]
let kaz = [55.78987031938657,49.11708723921156]

function init(){
    let map = new ymaps.Map('map_id', {
        center: center,
        zoom: 11
    });

    let placemark_izm = new ymaps.Placemark(izm, {iconContent: "Флагманский МЦ на Измайлово"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_baum = new ymaps.Placemark(baum, {iconContent: "Клиника на Бауманской"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_bab = new ymaps.Placemark(bab, {iconContent: "Пункт приёма анализов"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_pres = new ymaps.Placemark(pres, {iconContent: "Клиника на Пресне"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_dib = new ymaps.Placemark(dib, {iconContent: "Филиал в СПБ"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_lig = new ymaps.Placemark(lig, {iconContent: "Пункт приёма анализов СПБ"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_kaz = new ymaps.Placemark(kaz, {iconContent: "Филиал в Казани"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    map.geoObjects.add(placemark_izm);
    map.geoObjects.add(placemark_baum);
    map.geoObjects.add(placemark_bab);
    map.geoObjects.add(placemark_pres);
    map.geoObjects.add(placemark_dib);
    map.geoObjects.add(placemark_lig);
    map.geoObjects.add(placemark_kaz);
}

ymaps.ready(init);