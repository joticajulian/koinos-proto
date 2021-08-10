@0x84ec6e4d17f7a526; # unique file ID, generated by `capnp id`

using Common = import "../common.capnp";
using Protocol = import "../protocol/protocol.capnp";
using Json = Common.Json;

$import "/capnp/c++.capnp".namespace("koinos::chain");

using Go = import "/go.capnp";
$Go.package("chain");
$Go.import("github.com/koinos/koinos-proto-golang/koinos/chain");

enum Privilege {
   kernelMode @0;
   userMode   @1;
}

struct HeadInfo {
   headTopology           @0 :Common.BlockTopology;
   lastIrreversibleHeight @1 :Common.BlockHeightType;
}

struct PrintsArgs {
   message @0 :Text;
}

struct PrintsReturn {}

struct VerifyBlockSignatureArgs {
   digest        @0 :Common.Hash $Json.hex;
   activeData    @1 :Common.Opaque(Protocol.ActiveBlockData);
   signatureData @2 :Data;
}

struct VerifyBlockSignatureReturn {
   result @0 :Bool;
}

struct VerifyMerkleRootArgs {
   root   @0 :Common.Hash $Json.hex;
   hashes @1 :List(Common.Hash);
}

struct VerifyMerkleRootReturn {
   result @0 :Bool;
}

struct ApplyBlockArgs {
   block                     @0 :Protocol.Block;
   checkPassiveData          @1 :Bool;
   checkBlockSignature       @2 :Bool;
   checkTransactionSignature @3 :Bool;
}

struct ApplyBlockReturn {}

struct ApplyTransactionArgs {
   transasction @0 :Protocol.Transaction;
}

struct ApplyTransactionReturn {}

struct ApplyUploadContractOperationArgs {
   op @0 :Protocol.UploadContractOperation;
}

struct ApplyUploadContractOperationReturn {}

struct ApplyExecuteContractOperationArgs {
   op @0 :Protocol.CallContractOperation;
}

struct ApplyExecuteContractOperationReturn {}

struct ApplySetSystemCallOperationArgs {
   op @0 :Protocol.SetSystemCallOperation;
}

struct ApplySetSystemCallOperationReturn {}

struct DBPutObjectArgs {
   space @0 :Data $Json.hex; #UInt256
   key   @1 :Data $Json.hex; #UInt256
   obj   @2 :Data;
}

struct DBPutObjectReturn {
   result @0 :Bool;
}

struct DBGetObjectArgs {
   space          @0 :Data $Json.hex; #UInt256
   key            @1 :Data $Json.hex; #UInt256
   objectSizeHint @2 :Int32;
}

struct DBGetObjectReturn {
   result @0 :Data;
}

using DBGetNextObjectArgs = DBGetObjectArgs;

using DBGetNextObjectReturn = DBGetObjectReturn;

using DBGetPrevObjectArgs = DBGetObjectArgs;

using DBGetPrevObjectReturn = DBGetObjectReturn;

struct ExecuteContractArgs {
   contractID @0 :Data $Json.hex;
   entryPoint @1 :UInt32;
   args       @2 :Data;
}

struct ExecuteContractReturn {
   result @0 :Data;
}

struct GetEntryPointArgs {}

struct GetEntryPointReturn {
   result @0 :UInt32;
}

struct GetContractArgsSizeArgs {}

struct GetContracrArgsSizeReturn {
   result @0 :UInt32;
}

struct GetContractArgsArgs {}

struct GetContractArgsReturn {
   result @0 :Data;
}

struct SetContractReturnArgs {
   value @0 :Data;
}

struct SetContractReturnReturn {}

struct ExitContractArgs {
   exitCode @0 :UInt8;
}

struct ExitContractReturn {}

struct GetHeadInfoArgs {}

using GetHeadInfoReturn = HeadInfo;
