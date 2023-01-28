class Evento < ApplicationRecord
        def start_time
            self.inicio ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
        end
end
