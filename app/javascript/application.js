// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails" // original do Rails 7


require("@rails/ujs").start()
require("turbolinks").start()
require("./channels")
require('./agendadas/index')
require('./agendadas/agendar')

import * as ActiveStorage from "@rails/activestorage"

import 'bootstrap';

import { loadDynamicBannerText } from './components/banner';
import { inicioP, fimP } from './agendadas/index';
import { horas } from './agendadas/agendar';

const inicio = document.getElementById('inicio');
const fim = document.getElementById('fim');
const data = document.getElementById('data');

document.addEventListener('turbolinks:load', () => {
  ActiveStorage.start()
  loadDynamicBannerText();
  if (inicio) inicio.addEventListener('change', () => { inicioP(inicio) });
  if (fim) fim.addEventListener('change', () => { fimP(fim) });
  if (data) data.addEventListener('change', () => { horas(data) });
});