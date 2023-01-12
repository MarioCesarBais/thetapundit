const horas = (() => {
    //pega o value do select
    const data = document.getElementById("data");
    const e = data.querySelector('select');
    const dataSelecionada = e.options[e.selectedIndex].value;
    const hora = document.getElementById('hora');
    const eh = hora.querySelector('select');
    const h = eh.options;

    Array.apply(null, h).forEach(element => {
        if (element.value.substring(0,10) == dataSelecionada) {
            element.style.display = '';
            element.innerText = element.value.substring(11, 16);
        }
        else element.style.display = 'none';
    });

    $('#hora').trigger("chosen:updated");
});

// const hora_sem_data = (() => {
//     const hora = document.getElementById('hora');
//     if (hora) const eh = hora.querySelector('select');
//     if (eh) const h = eh.options;

//     Array.apply(null, h).forEach(element => { element.innerText = element.value.substring(11, 16); });
// })

export { horas }