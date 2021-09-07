// SPDX-License-Identifier: JAIRO LAMUS
pragma solidity ^0.7.5;

contract Accounts4 {
    
    //___________________________________________________________________
    //VARIABLES GLOBALES
    //uint256 v_cuenta1_saldodisponible;
    string public v_saludo_banco="Bienvenido a BanCripto";
    string v_saludo_contrato="Tu contrato esta on-line";
    string v_nombre_invocante;
    uint256 v_tipo_prestamo;
    address v_owner;
    
    //Modifier para que solo se aplique cuando sea el dueño del 
    //contrato el INVOCANTE
    modifier onlyOwner{
        require( msg.sender == v_owner );
        _;
        
    }
    
    //___________________________________________________________________
    //DEPLOY
    //inicio, payable para que recibe valor el balance
    function Banco4 () payable public{
        //setea en v_owner la cuenta que hizo el deploy y la hace propietaria
        v_owner = msg.sender;
    }
    
    //___________________________________________________________________
    //GENERALIDADES
    //saludo del banco-contrato
    function get_Wellcome () public view returns(string memory) {
        //v_saludo="h";
        return v_saludo_contrato;
    }
    
    function get_tipo_prestamo () public view returns(uint256){
        return v_tipo_prestamo;
    }
    
    function set_tipo_prestamo(uint256 vp_tipo_prestamo) public{
        require (vp_tipo_prestamo>5);
        v_tipo_prestamo=vp_tipo_prestamo;
    }
    //___________________________________________________________________
    //CONTRATO
    //getea la cuenta del contrato
    function get_Cuenta_Contrato() public view returns(address){
        return address(this);
    }
    
    //setea saldo del contrato
    //function Suma_Saldo_Contrato(uint256 vp_saldo) payable public {
        //address.balance=5;
        //require( msg.value==vp_saldo ); //no funciona
    //}
    
    //getea el saldo del contrato
    function get_Saldo_Contrato() public view returns(uint256){
        //return this.balance;
        return address(this).balance;
    }
    
    //function get_Saldo_Contrato2() public view returns(uint256){
    //    return msg.value;//no funciona
    //}
    
    //getea la cuenta propietaria del contrato
    function get_Owner () public view returns(address){
        return v_owner;
    }
    
    //cambia el propietario del smart contract por una nueva cuenta
    function set_New_Owner(address vp_new_owner) public {
        v_owner = vp_new_owner;
    }
    
    //cambia el propietario del smart contract por una nueva cuenta
    //pero solo si el cambio lo hace el propietario actual
    function set_Change_Owner(address vp_new_owner) public {
    require( msg.sender == v_owner );
        v_owner = vp_new_owner;
    }
    
    //cambia el propietario del smart contract por una nueva cuenta
    //pero solo si el cambio lo hace el propietario actual
    //Se usa el Modifier
    function set_Change_Owner_modifier(address vp_new_owner) public onlyOwner {
    require( msg.sender == v_owner );
        v_owner = vp_new_owner;
    }
    
    //___________________________________________________________________
    //INVOCANTE -SENDER-
    
    //setea nombre del invocante
    function set_Nombre_Invocante(string memory vp_nombre_invocante ) public {
        v_nombre_invocante=vp_nombre_invocante;
    }
    
    //getea nombre del invocante
    function get_Nombre_Invocante() public view returns(string memory) {
        return v_nombre_invocante;
    }
    
    //getea cuenta del invocante
    function get_Cuenta_Invocante () public view returns (address){
        return address(msg.sender);
    }
    
    //getea saldo del invocante
    function get_Saldo_Invocante() public view returns (uint256){
        return msg.sender.balance;
    }
    
    //___________________________________________________________________
    //TRANSFERENCIAS
    //transfire saldo del contrato al invocante
    function Transfire_fromContrato_toInvocante() public {
        msg.sender.transfer ( address(this).balance    );
    }
    
    
    
    
    
    
    
    
    
    
}