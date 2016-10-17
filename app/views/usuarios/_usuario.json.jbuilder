json.extract! usuario, :id, :documento, :nome, :email, :senha, :cidade_id, :isPJ, :isInstituicao, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)