use alices_ring_cairo_verifier::structType::RingSignature;

#[starknet::interface]
pub trait IRingSignatureVerifier<TContractState> {
    fn verify_rs(ref self: TContractState, ring_signature: RingSignature )-> bool;
}

#[starknet::contract]
mod RingSignatureVerifier {
    use alices_ring_cairo_verifier::verify; 
    use alices_ring_cairo_verifier::structType::RingSignature;
    
    #[storage]
    struct Storage {}

    #[abi(embed_v0)]
    impl IRingSignatureVerifier of super::IRingSignatureVerifier<ContractState> {
        fn verify_rs(ref self: ContractState, ring_signature: RingSignature) -> bool {
            verify(ring_signature)
        }
    }
}
