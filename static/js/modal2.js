// Открыть модальное окно
document.getElementById("open_form2").addEventListener("click", function() {
    document.getElementById("modal_id2").classList.add("open")
})

// Закрыть модальное окно
document.getElementById("close_modal_id2").addEventListener("click", function() {
    document.getElementById("modal_id2").classList.remove("open")
})

// Закрыть модальное окно при нажатии на Esc
// Закрыть модальное окно при нажатии на Esc
window.addEventListener('keydown', (e) => {
    if (e.key === "Escape") {
        document.getElementById("modal_id2").classList.remove("open")
    }
});

// Закрыть модальное окно при клике вне его
document.querySelector("#modal_id2 .modal_box").addEventListener('click', event => {
    event._isClickWithInModal = true;
});
document.getElementById("modal_id2").addEventListener('click', event => {
    if (event._isClickWithInModal) return;
    event.currentTarget.classList.remove('open');
});