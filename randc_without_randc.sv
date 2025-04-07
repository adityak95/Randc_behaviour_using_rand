class sample;
bit[3:0]used_data[$];
rand bit[3:0]data;

constraint d_c{
			!(data inside {used_data});
}

function void post_randomize();
	used_data.push_front(data);
	if(used_data.size()==16) used_data.delete();
endfunction
endclass

module top;
sample s=new();

initial begin 
	repeat(16)begin 
		s.randomize();
		$display("data=%0d",s.data);
	end
end

endmodule
