document.querySelector('#elastic').oninput = function() {
    let val = this.value.trim().toLowerCase();
    let elasticItems = document.querySelectorAll('.elastic li');
    if (val != '') {
        elasticItems.forEach(function (elem) {
            let text = elem.innerText.toLowerCase();
            if (text.indexOf(val) === -1) {
                elem.classList.add('hide');
                elem.innerHTML = elem.innerText;
            } else {
                elem.classList.remove('hide');
                let startPos = text.indexOf(val);
                let endPos = startPos + val.length;
                let str = elem.innerText;
                elem.innerHTML = insertMark(str, startPos, endPos - startPos);
            }
        });
    } else {
        elasticItems.forEach(function (elem) {
            elem.classList.remove('hide');
            elem.innerHTML = elem.innerText;
        });
    }
}

function insertMark(string, pos, len) {
    return string.slice(0, pos) + '<code>' + string.slice(pos, pos + len) + '</code>' + string.slice(pos + len);
}
