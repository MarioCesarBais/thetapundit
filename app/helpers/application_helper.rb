module ApplicationHelper

  DIAS_SEMANA = %w(segunda terça quarta quinta sexta sábado domingo)

  FOTOS = {
    h: [
      'Cabeca.jpg',
      'DNa.jpg',
      'Lago.jpg',
      'Libertacao.jpg',
      'louis-hansel-7TIUb6CpG_w-unsplash.jpg',
      'luzcabeca.jpg',
      'maos.jpg',
      'porsolmar.jpg',
      'variasmaos.jpg',
      'bruna_medit.jpg',
      'Digging.jpg',
      'DNA_AVANCADO.png',
      'DNA_Basico.png',
      'mochila_livro.jpg',
      'par_medit2.jpg',
      'par_medit3.jpg'
    ],

    v: [
    'Bonecos.jpg',
    'entrega_certificado.jpg',
    'Formadas5.jpg',
    'Meditacao3Duplas.jpg',
    'MeditacaoemDupla.jpg',
    'Meditando5.jpg'
    ]
  }

  def foto_aleatoria(format, length)
    FOTOS[format].shuffle[(0..[FOTOS[format].length - 1, length].min)]
  end

  def user_avatar(user, size=40)
    if user.foto.attached?
      user.foto.variant(resize_to_limit: [40, 40])
    else
      gravatar_image_url(user.email)
    end
  end

end
