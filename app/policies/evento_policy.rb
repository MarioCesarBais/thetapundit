class EventoPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  
    def index?
      true
    end

    def show?
      true
    end
  
    def create?
      @user.role == 'admin' # somente administrador pode criar evento
    end
  
    def update?
      @user.role == 'admin'
    end
  
    def destroy?
      @user.role == 'admin'
    end
  
  end