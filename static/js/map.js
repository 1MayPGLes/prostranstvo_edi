let center = [55.752053479087934,37.61903642835505]
let izm = [55.78937290476116,37.792628747732934]
let baum = [55.76593879222048,37.68554204101422]
let bab = [55.881144363411515,37.641096266588605]
let pres = [55.761166152756594,37.57841959629285]

function init(){
    let map = new ymaps.Map('map_id', {
        center: center,
        zoom: 11
    });

    let placemark_izm = new ymaps.Placemark(izm, {iconContent: "Гипермаркет на Измайлово"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_baum = new ymaps.Placemark(baum, {iconContent: "Гипермаркет на Бауманской"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_bab = new ymaps.Placemark(bab, {iconContent: "Гипермаркет на Бабушкинской"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    let placemark_pres = new ymaps.Placemark(pres, {iconContent: "Гипермаркет на Пресне"}, {
        balloonPanelMaxMapArea: 0,
        preset: "islands#blueStretchyIcon",
        openEmptyBalloon: true
    });

    map.geoObjects.add(placemark_izm);
    map.geoObjects.add(placemark_baum);
    map.geoObjects.add(placemark_bab);
    map.geoObjects.add(placemark_pres);

}

ymaps.ready(init);