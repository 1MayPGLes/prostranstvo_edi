// Открыть модальное окно
document.getElementById("open_form").addEventListener("click", function() {
    document.getElementById("modal_id").classList.add("open")
})

// Закрыть модальное окно
document.getElementById("close_modal_id").addEventListener("click", function() {
    document.getElementById("modal_id").classList.remove("open")
})

// Закрыть модальное окно при нажатии на Esc
// Закрыть модальное окно при нажатии на Esc
window.addEventListener('keydown', (e) => {
    if (e.key === "Escape") {
        document.getElementById("modal_id").classList.remove("open")
    }
});

// Закрыть модальное окно при клике вне его
document.querySelector("#modal_id .modal_box").addEventListener('click', event => {
    event._isClickWithInModal = true;
});
document.getElementById("modal_id").addEventListener('click', event => {
    if (event._isClickWithInModal) return;
    event.currentTarget.classList.remove('open');
});