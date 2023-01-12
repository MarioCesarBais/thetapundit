const inicio = document.getElementById('inicio');
const fim = document.getElementById('fim');
// function checarData(data) {
//   return data instanceof Date && ! isNaN(data);
// };
const inicioP = (() => {
  const inDia = parseInt(inicio.children[0].value.substring(8, 10));
  const inMes = parseInt(inicio.children[0].value.substring(5, 7)) - 1;
  const inAno = parseInt(inicio.children[0].value.substring(0, 4));
  const ini = new Date (inAno, inMes, inDia);
  const lines = document.querySelectorAll('.line-to-select');
  lines.forEach((line) => {
    const lineDia = parseInt(line.id.substring(0, 2));
    const lineMes = parseInt(line.id.substring(2, 4));
    const lineAno = parseInt(line.id.substring(4, 8));
    const lineIni = new Date (lineAno, lineMes - 1, lineDia);
    if (lineIni < ini) line.style.display = "none"
    else if (fim.children[0].value) {
      const fiDia = parseInt(fim.children[0].value.substring(8, 10));
      const fiMes = parseInt(fim.children[0].value.substring(5, 7)) - 1;
      const fiAno = parseInt(fim.children[0].value.substring(0, 4));
      const fi = new Date(fiAno, fiMes, fiDia);
      if (lineIni > fi) line.style.display = "none"
      else line.style.display = "table-row";}
    else line.style.display = "table-row";      
  });
});
const fimP = (() => {
  const fiDia = parseInt(fim.children[0].value.substring(8, 10));
  const fiMes = parseInt(fim.children[0].value.substring(5, 7)) - 1;
  const fiAno = parseInt(fim.children[0].value.substring(0, 4));
  const fi = new Date(fiAno, fiMes, fiDia);
  const lines = document.querySelectorAll('.line-to-select');
  lines.forEach((line) => {
    const lineDia = parseInt(line.id.substring(0, 2));
    const lineMes = parseInt(line.id.substring(2, 4));
    const lineAno = parseInt(line.id.substring(4, 8));
    const lineFi = new Date(lineAno, lineMes - 1, lineDia);
    if (lineFi > fi) line.style.display = "none"
    else if (inicio.children[0].value) {
      const inDia = parseInt(inicio.children[0].value.substring(8, 10));
      const inMes = parseInt(inicio.children[0].value.substring(5, 7)) - 1;
      const inAno = parseInt(inicio.children[0].value.substring(0, 4));
      const ini = new Date (inAno, inMes, inDia);
      // debugger;
      if (lineFi < ini) line.style.display = "none"
      else line.style.display = "table-row";
    }
    else line.style.display = "table-row";
  })
})

export { inicioP, fimP }