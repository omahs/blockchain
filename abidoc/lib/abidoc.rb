require 'abiparser'


## our own code
require_relative 'abidoc/version'    # note: let version always go first



module ABI
  class Contract


def generate_doc( title: 'Contract ABI' )
  buf = ''
  buf << "# #{title}\n\n"

  if @ctor
    buf << "\n"
    buf << "**Constructor**\n\n"
    buf << "- #{@ctor.doc}\n"
    ## buf << "  - sig #{@ctor.sig}  =>  0x#{sig(@ctor.sig).hexdigest}\n"
  end

  if payable_functions.size > 0
    buf << "\n"
    buf << "**#{payable_functions.size} Payable Function(s)**\n\n"
    payable_functions.each do |func|
      buf << "- #{func.doc} _payable_\n"
      ## buf << "  - sig #{func.sig}  =>  0x#{sig(func.sig).hexdigest}\n"
    end
  end

  if transact_functions.size > 0
    buf << "\n"
    buf << "**#{transact_functions.size} Transact Functions(s)**\n\n"
    transact_functions.each do |func|
      buf << "- #{func.doc}\n"
      ## buf << "  - sig #{func.sig}  =>  0x#{sig(func.sig).hexdigest}\n"
    end
  end

  if query_functions.size > 0
    buf << "\n"
    buf << "**#{query_functions.size} Query Functions(s)**\n\n"
    query_functions.each do |func|
      buf << "- #{func.doc} _readonly_\n"
      ## buf << "  - sig #{func.sig}  =>  0x#{sig(func.sig).hexdigest}\n"
    end
  end

  if helper_functions.size > 0
    buf << "\n"
    buf << "**#{helper_functions.size} Helper Functions(s)**\n\n"
    helper_functions.each do |func|
      buf << "- #{func.doc}\n"
      ## buf << "  - sig #{func.sig}  =>  0x#{sig(func.sig).hexdigest}\n"
    end
  end

  buf
end

end  ## class Contract
end ##  module ABI
