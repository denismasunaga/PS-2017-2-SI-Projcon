class Projeto
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :nome, :type => String
  field :descricao, :type => String
  field :status, :type => Integer

  def status_string
    if self.status == 0
      return 'Novo'
    elsif self.status == 1
      return 'Em andamento'
    elsif self.status == 2
      return 'Atrasado'
    elsif self.status == 3
      return 'Finalizado'
    end
  end
end
