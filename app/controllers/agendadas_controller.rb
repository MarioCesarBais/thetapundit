class AgendadasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agendada, only: [:edit, :destroy]

  DIAS_SEMANA = %i(domingo segunda terça quarta quinta sexta sábado)

  def distribui
    case params[:commit]
    when "Inserir Períodos na Agenda"
      params.require(:agendada).permit(:data_inicio, :data_fim, :duracao, :hora_inicio, :hora_fim, :segunda, :terça, :quarta, :quinta, :sexta, :sábado, :domingo, :commit)
      create
    when 'Agendar'
      authorize Agendada
      agendar
    else
      authorize Agendada
      return
    end
  end

  def index
    policy_scope(Agendada)
    @agendadas = Agendada.all
    unless @agendadas.nil?
      @agendadas = @agendadas.select { |agendada| agendada.data_hora >= Time.now - 3600 }
      @agendadas = current_user.role == 'admin' ? @agendadas : @agendadas.select { |agendada| agendada.user == current_user.id }
      @agendadas = @agendadas.sort_by { |agendada| agendada.data_hora }
    end
    @agendadas
  end

  def create
    params.require(:agendada).permit(:data_inicio, :data_fim, :duracao, :hora_inicio, :hora_fim, :atend, :segunda, :terça, :quarta, :quinta, :sexta, :sábado, :domingo)
    if params['agendada']['data_inicio'].blank? then data_inicio = Date.today
    else data_inicio = params['agendada']['data_inicio'].to_date
    end
    inicio = [data_inicio, Date.today].max.to_date
    if params['agendada']['data_fim'].blank? then fim = Date.today + 7
    else fim = params['agendada']['data_fim'].to_date
    end
    hora_inicio = "#{params['agendada']['hora_inicio(4i)']}:#{params['agendada']['hora_inicio(5i)']}".to_time
    hora_fim = "#{params['agendada']['hora_fim(4i)']}:#{params['agendada']['hora_fim(5i)']}".to_time
    duracao = params['agendada']['duracao'].to_i*60
    hora = hora_inicio
    i = 0
    hora_a = []
    while hora < hora_fim
      hora_a[i] = hora
      i+=1
      hora+=duracao
    end
    unless hora_a.nil? || hora_a.empty?
      hora_a.pop if hora_a.last + duracao > hora_fim
      (inicio..fim).each { |dia|
        next if params[:agendada][DIAS_SEMANA[dia.wday]] == '0'
        hora_a.each { |hora|
          data_hora_agenda = dia.to_time + hora.hour * 60 * 60 + hora.min * 60
          next if data_hora_agenda < Time.now
          next unless sem_conflito_agenda(data_hora_agenda, duracao)
          @agendada = Agendada.create!(data_hora: data_hora_agenda, atend: params['agendada']['atend'])
        }
      }
    end
    policy_scope(Agendada)
    @agendadas = Agendada.all
    authorize @agendadas
    redirect_to agendadas_path
  end

  def agendar
    authorize Agendada
    if params[:format].present? # se presente, demanda veio do administrador via index
      @agendadas = [Agendada.find(params[:format])]
    else
      @agendadas = Agendada.all.select { |agendada| agendada.data_hora > Time.now && agendada.user.nil? }.sort_by { |agendada| agendada.data_hora }
    end
  end

  def marcar
    if params['agendada']['data'].blank?
      skip_authorization
      return
    end
    params.require(:agendada).permit(:data, :hora, :user, :atend)
    @agendada = Agendada.find_by(data_hora: "#{params['agendada']['data']} #{params['agendada']['hora']}".to_time)
    current_user.role == 'admin' ? @agendada.user = params['agendada']['user'] : @agendada.user = current_user.id
    @agendada.atend = params['agendada']['atend']
    @agendada.save ? flash.notice = "Agendado com Sucesso!" : flash.alert = "Agendamento falhou! Verificar!"
    authorize Agendada
    redirect_to agendadas_path
  end

  def edit
    @agendada.user = nil
    @agendada.save!
    redirect_to agendadas_path
  end

  def destroy
    @agendada.destroy!
    redirect_to agendadas_path
  end

  
  private

  def sem_conflito_agenda(dh, du)
    Agendada.all.map(&:data_hora).all? do |dha|
      menor = [dh, dha].min
      maior = [dh, dha].max
      menor + du <= maior
    end
  end

  def set_agendada
    @agendada = Agendada.find(params[:id])
    authorize @agendada
  end

end