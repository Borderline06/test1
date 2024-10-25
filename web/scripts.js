document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', function() {
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-pane').forEach(pane => pane.classList.remove('active'));

        tab.classList.add('active');
        document.querySelectorAll('.tab-pane')[Array.from(tab.parentElement.children).indexOf(tab)].classList.add('active');
    });
});
