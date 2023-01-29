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
      'par_medit3.jpg',
      'pexels-belle-co-1000445.jpg',
      'pexels-pixabay-158465.jpg',
      'pexels-prasanth-inturi-1051838.jpg',
      'pexels-rodnae-productions-7468213.jpg',
      'pexels-this-is-zun-1164572.jpg',
      'pexels-tima-miroshnichenko-5710976.jpg',
      'pexels-tima-miroshnichenko-5711177.jpg'
    ],

    v: [
    'Bonecos.jpg',
    'entrega_certificado.jpg',
    'Formadas5.jpg',
    'Meditacao3Duplas.jpg',
    'MeditacaoemDupla.jpg',
    'Meditando5.jpg',
    'pexels-arthouse-studio-7363298.jpg',
    'pexels-cottonbro-4056529.jpg',
    'pexels-tima-miroshnichenko-5710956.jpg',
    'pexels-tima-miroshnichenko-5711033.jpg'
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
