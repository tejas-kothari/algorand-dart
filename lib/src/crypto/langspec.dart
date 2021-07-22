const LANG_SPEC = '''
{
	"EvalMaxVersion": 4,
	"LogicSigVersion": 3,
	"Ops": [{
			"Opcode": 0,
			"Name": "err",
			"Cost": 1,
			"Size": 1,
			"Doc": "Error. Panic immediately. This is primarily a fencepost against accidental zero bytes getting compiled into programs.",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 1,
			"Name": "sha256",
			"Args": "B",
			"Returns": "B",
			"Cost": 35,
			"Size": 1,
			"Doc": "SHA256 hash of value X, yields [32]byte",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 2,
			"Name": "keccak256",
			"Args": "B",
			"Returns": "B",
			"Cost": 130,
			"Size": 1,
			"Doc": "Keccak256 hash of value X, yields [32]byte",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 3,
			"Name": "sha512_256",
			"Args": "B",
			"Returns": "B",
			"Cost": 45,
			"Size": 1,
			"Doc": "SHA512_256 hash of value X, yields [32]byte",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 4,
			"Name": "ed25519verify",
			"Args": "BBB",
			"Returns": "U",
			"Cost": 1900,
			"Size": 1,
			"Doc": "for (data A, signature B, pubkey C) verify the signature of (ProgData || program_hash || data) against the pubkey => {0 or 1}",
			"DocExtra": "The 32 byte public key is the last element on the stack, preceded by the 64 byte signature at the second-to-last element on the stack, preceded by the data which was signed at the third-to-last element on the stack.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 8,
			"Name": "+",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A plus B. Panic on overflow.",
			"DocExtra": "Overflow is an error condition which halts execution and fails the transaction. Full precision is available from `addw`.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 9,
			"Name": "-",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A minus B. Panic if B > A.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 10,
			"Name": "/",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A divided by B. Panic if B == 0.",
			"DocExtra": "`divmodw` is available to divide the two-element values produced by `mulw` and `addw`.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 11,
			"Name": "*",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A times B. Panic on overflow.",
			"DocExtra": "Overflow is an error condition which halts execution and fails the transaction. Full precision is available from `mulw`.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 12,
			"Name": "<",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A less than B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 13,
			"Name": ">",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A greater than B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 14,
			"Name": "<=",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A less than or equal to B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 15,
			"Name": ">=",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A greater than or equal to B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 16,
			"Name": "&&",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is not zero and B is not zero => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 17,
			"Name": "||",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is not zero or B is not zero => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 18,
			"Name": "==",
			"Args": "..",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is equal to B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 19,
			"Name": "!=",
			"Args": "..",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is not equal to B => {0 or 1}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 20,
			"Name": "!",
			"Args": "U",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "X == 0 yields 1; else 0",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 21,
			"Name": "len",
			"Args": "B",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "yields length of byte value X",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 22,
			"Name": "itob",
			"Args": "U",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "converts uint64 X to big endian bytes",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 23,
			"Name": "btoi",
			"Args": "B",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "converts bytes X as big endian to uint64",
			"DocExtra": "`btoi` panics if the input is longer than 8 bytes.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 24,
			"Name": "%",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A modulo B. Panic if B == 0.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 25,
			"Name": "|",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A bitwise-or B",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 26,
			"Name": "&",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A bitwise-and B",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 27,
			"Name": "^",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A bitwise-xor B",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 28,
			"Name": "~",
			"Args": "U",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "bitwise invert value X",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 29,
			"Name": "mulw",
			"Args": "UU",
			"Returns": "UU",
			"Cost": 1,
			"Size": 1,
			"Doc": "A times B out to 128-bit long result as low (top) and high uint64 values on the stack",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 30,
			"Name": "addw",
			"Args": "UU",
			"Returns": "UU",
			"Cost": 1,
			"Size": 1,
			"Doc": "A plus B out to 128-bit long result as sum (top) and carry-bit uint64 values on the stack",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 31,
			"Name": "divmodw",
			"Args": "UUUU",
			"Returns": "UUUU",
			"Cost": 20,
			"Size": 1,
			"Doc": "Pop four uint64 values.  The deepest two are interpreted as a uint128 dividend (deepest value is high word), the top two are interpreted as a uint128 divisor.  Four uint64 values are pushed to the stack. The deepest two are the quotient (deeper value is the high uint64). The top two are the remainder, low bits on top.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 32,
			"Name": "intcblock",
			"Cost": 1,
			"Size": 0,
			"Doc": "prepare block of uint64 constants for use by intc",
			"DocExtra": "`intcblock` loads following program bytes into an array of integer constants in the evaluator. These integer constants can be referred to by `intc` and `intc_*` which will push the value onto the stack. Subsequent calls to `intcblock` reset and replace the integer constants available to the script.",
			"ImmediateNote": "{varuint length} [{varuint value}, ...]",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 33,
			"Name": "intc",
			"Returns": "U",
			"Cost": 1,
			"Size": 2,
			"Doc": "push Ith constant from intcblock to stack",
			"ImmediateNote": "{uint8 int constant index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 34,
			"Name": "intc_0",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 0 from intcblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 35,
			"Name": "intc_1",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 1 from intcblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 36,
			"Name": "intc_2",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 2 from intcblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 37,
			"Name": "intc_3",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 3 from intcblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 38,
			"Name": "bytecblock",
			"Cost": 1,
			"Size": 0,
			"Doc": "prepare block of byte-array constants for use by bytec",
			"DocExtra": "`bytecblock` loads the following program bytes into an array of byte-array constants in the evaluator. These constants can be referred to by `bytec` and `bytec_*` which will push the value onto the stack. Subsequent calls to `bytecblock` reset and replace the bytes constants available to the script.",
			"ImmediateNote": "{varuint length} [({varuint value length} bytes), ...]",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 39,
			"Name": "bytec",
			"Returns": "B",
			"Cost": 1,
			"Size": 2,
			"Doc": "push Ith constant from bytecblock to stack",
			"ImmediateNote": "{uint8 byte constant index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 40,
			"Name": "bytec_0",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 0 from bytecblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 41,
			"Name": "bytec_1",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 1 from bytecblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 42,
			"Name": "bytec_2",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 2 from bytecblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 43,
			"Name": "bytec_3",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push constant 3 from bytecblock to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 44,
			"Name": "arg",
			"Returns": "B",
			"Cost": 1,
			"Size": 2,
			"Doc": "push Nth LogicSig argument to stack",
			"ImmediateNote": "{uint8 arg index N}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 45,
			"Name": "arg_0",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push LogicSig argument 0 to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 46,
			"Name": "arg_1",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push LogicSig argument 1 to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 47,
			"Name": "arg_2",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push LogicSig argument 2 to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 48,
			"Name": "arg_3",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push LogicSig argument 3 to stack",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 49,
			"Name": "txn",
			"Returns": ".",
			"Cost": 1,
			"Size": 2,
			"ArgEnum": [
				"Sender",
				"Fee",
				"FirstValid",
				"FirstValidTime",
				"LastValid",
				"Note",
				"Lease",
				"Receiver",
				"Amount",
				"CloseRemainderTo",
				"VotePK",
				"SelectionPK",
				"VoteFirst",
				"VoteLast",
				"VoteKeyDilution",
				"Type",
				"TypeEnum",
				"XferAsset",
				"AssetAmount",
				"AssetSender",
				"AssetReceiver",
				"AssetCloseTo",
				"GroupIndex",
				"TxID",
				"ApplicationID",
				"OnCompletion",
				"ApplicationArgs",
				"NumAppArgs",
				"Accounts",
				"NumAccounts",
				"ApprovalProgram",
				"ClearStateProgram",
				"RekeyTo",
				"ConfigAsset",
				"ConfigAssetTotal",
				"ConfigAssetDecimals",
				"ConfigAssetDefaultFrozen",
				"ConfigAssetUnitName",
				"ConfigAssetName",
				"ConfigAssetURL",
				"ConfigAssetMetadataHash",
				"ConfigAssetManager",
				"ConfigAssetReserve",
				"ConfigAssetFreeze",
				"ConfigAssetClawback",
				"FreezeAsset",
				"FreezeAssetAccount",
				"FreezeAssetFrozen",
				"Assets",
				"NumAssets",
				"Applications",
				"NumApplications",
				"GlobalNumUint",
				"GlobalNumByteSlice",
				"LocalNumUint",
				"LocalNumByteSlice",
				"ExtraProgramPages"
			],
			"ArgEnumTypes": "BUUUUBBBUBBBUUUBUUUBBBUBUUBUBUBBBUUUUBBBBBBBBUBUUUUUUUUUU",
			"Doc": "push field F of current transaction to stack",
			"DocExtra": "FirstValidTime causes the program to fail. The field is reserved for future use.",
			"ImmediateNote": "{uint8 transaction field index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 50,
			"Name": "global",
			"Returns": ".",
			"Cost": 1,
			"Size": 2,
			"ArgEnum": [
				"MinTxnFee",
				"MinBalance",
				"MaxTxnLife",
				"ZeroAddress",
				"GroupSize",
				"LogicSigVersion",
				"Round",
				"LatestTimestamp",
				"CurrentApplicationID",
				"CreatorAddress"
			],
			"ArgEnumTypes": "UUUBUUUUUB",
			"Doc": "push value from globals to stack",
			"ImmediateNote": "{uint8 global field index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 51,
			"Name": "gtxn",
			"Returns": ".",
			"Cost": 1,
			"Size": 3,
			"ArgEnum": [
				"Sender",
				"Fee",
				"FirstValid",
				"FirstValidTime",
				"LastValid",
				"Note",
				"Lease",
				"Receiver",
				"Amount",
				"CloseRemainderTo",
				"VotePK",
				"SelectionPK",
				"VoteFirst",
				"VoteLast",
				"VoteKeyDilution",
				"Type",
				"TypeEnum",
				"XferAsset",
				"AssetAmount",
				"AssetSender",
				"AssetReceiver",
				"AssetCloseTo",
				"GroupIndex",
				"TxID",
				"ApplicationID",
				"OnCompletion",
				"ApplicationArgs",
				"NumAppArgs",
				"Accounts",
				"NumAccounts",
				"ApprovalProgram",
				"ClearStateProgram",
				"RekeyTo",
				"ConfigAsset",
				"ConfigAssetTotal",
				"ConfigAssetDecimals",
				"ConfigAssetDefaultFrozen",
				"ConfigAssetUnitName",
				"ConfigAssetName",
				"ConfigAssetURL",
				"ConfigAssetMetadataHash",
				"ConfigAssetManager",
				"ConfigAssetReserve",
				"ConfigAssetFreeze",
				"ConfigAssetClawback",
				"FreezeAsset",
				"FreezeAssetAccount",
				"FreezeAssetFrozen",
				"Assets",
				"NumAssets",
				"Applications",
				"NumApplications",
				"GlobalNumUint",
				"GlobalNumByteSlice",
				"LocalNumUint",
				"LocalNumByteSlice",
				"ExtraProgramPages"
			],
			"ArgEnumTypes": "BUUUUBBBUBBBUUUBUUUBBBUBUUBUBUBBBUUUUBBBBBBBBUBUUUUUUUUUU",
			"Doc": "push field F of the Tth transaction in the current group",
			"DocExtra": "for notes on transaction fields available, see `txn`. If this transaction is _i_ in the group, `gtxn i field` is equivalent to `txn field`.",
			"ImmediateNote": "{uint8 transaction group index} {uint8 transaction field index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 52,
			"Name": "load",
			"Returns": ".",
			"Cost": 1,
			"Size": 2,
			"Doc": "copy a value from scratch space to the stack",
			"ImmediateNote": "{uint8 position in scratch space to load from}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 53,
			"Name": "store",
			"Args": ".",
			"Cost": 1,
			"Size": 2,
			"Doc": "pop a value from the stack and store to scratch space",
			"ImmediateNote": "{uint8 position in scratch space to store to}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 54,
			"Name": "txna",
			"Returns": ".",
			"Cost": 1,
			"Size": 3,
			"ArgEnum": [
				"ApplicationArgs",
				"Accounts"
			],
			"ArgEnumTypes": "BBUU",
			"Doc": "push Ith value of the array field F of the current transaction",
			"ImmediateNote": "{uint8 transaction field index} {uint8 transaction field array index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 55,
			"Name": "gtxna",
			"Returns": ".",
			"Cost": 1,
			"Size": 4,
			"ArgEnum": [
				"ApplicationArgs",
				"Accounts"
			],
			"ArgEnumTypes": "BBUU",
			"Doc": "push Ith value of the array field F from the Tth transaction in the current group",
			"ImmediateNote": "{uint8 transaction group index} {uint8 transaction field index} {uint8 transaction field array index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 56,
			"Name": "gtxns",
			"Args": "U",
			"Returns": ".",
			"Cost": 1,
			"Size": 2,
			"ArgEnum": [
				"Sender",
				"Fee",
				"FirstValid",
				"FirstValidTime",
				"LastValid",
				"Note",
				"Lease",
				"Receiver",
				"Amount",
				"CloseRemainderTo",
				"VotePK",
				"SelectionPK",
				"VoteFirst",
				"VoteLast",
				"VoteKeyDilution",
				"Type",
				"TypeEnum",
				"XferAsset",
				"AssetAmount",
				"AssetSender",
				"AssetReceiver",
				"AssetCloseTo",
				"GroupIndex",
				"TxID",
				"ApplicationID",
				"OnCompletion",
				"ApplicationArgs",
				"NumAppArgs",
				"Accounts",
				"NumAccounts",
				"ApprovalProgram",
				"ClearStateProgram",
				"RekeyTo",
				"ConfigAsset",
				"ConfigAssetTotal",
				"ConfigAssetDecimals",
				"ConfigAssetDefaultFrozen",
				"ConfigAssetUnitName",
				"ConfigAssetName",
				"ConfigAssetURL",
				"ConfigAssetMetadataHash",
				"ConfigAssetManager",
				"ConfigAssetReserve",
				"ConfigAssetFreeze",
				"ConfigAssetClawback",
				"FreezeAsset",
				"FreezeAssetAccount",
				"FreezeAssetFrozen",
				"Assets",
				"NumAssets",
				"Applications",
				"NumApplications",
				"GlobalNumUint",
				"GlobalNumByteSlice",
				"LocalNumUint",
				"LocalNumByteSlice",
				"ExtraProgramPages"
			],
			"ArgEnumTypes": "BUUUUBBBUBBBUUUBUUUBBBUBUUBUBUBBBUUUUBBBBBBBBUBUUUUUUUUUU",
			"Doc": "push field F of the Ath transaction in the current group",
			"DocExtra": "for notes on transaction fields available, see `txn`. If top of stack is _i_, `gtxns field` is equivalent to `gtxn _i_ field`. gtxns exists so that _i_ can be calculated, often based on the index of the current transaction.",
			"ImmediateNote": "{uint8 transaction field index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 57,
			"Name": "gtxnsa",
			"Args": "U",
			"Returns": ".",
			"Cost": 1,
			"Size": 3,
			"ArgEnum": [
				"ApplicationArgs",
				"Accounts"
			],
			"ArgEnumTypes": "BBUU",
			"Doc": "push Ith value of the array field F from the Ath transaction in the current group",
			"ImmediateNote": "{uint8 transaction field index} {uint8 transaction field array index}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 58,
			"Name": "gload",
			"Returns": ".",
			"Cost": 1,
			"Size": 3,
			"Doc": "push Ith scratch space index of the Tth transaction in the current group",
			"DocExtra": "The `gload` opcode can only access scratch spaces of previous app calls contained in the current group.",
			"ImmediateNote": "{uint8 transaction group index} {uint8 position in scratch space to load from}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 59,
			"Name": "gloads",
			"Args": "U",
			"Returns": ".",
			"Cost": 1,
			"Size": 2,
			"Doc": "push Ith scratch space index of the Ath transaction in the current group",
			"DocExtra": "The `gloads` opcode can only access scratch spaces of previous app calls contained in the current group.",
			"ImmediateNote": "{uint8 position in scratch space to load from}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 60,
			"Name": "gaid",
			"Returns": "U",
			"Cost": 1,
			"Size": 2,
			"Doc": "push the ID of the asset or application created in the Tth transaction of the current group",
			"DocExtra": "The `gaid` opcode can only access the ID of assets or applications created by previous txns in the current group.",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 61,
			"Name": "gaids",
			"Args": "U",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "push the ID of the asset or application created in the Ath transaction of the current group",
			"DocExtra": "The `gaids` opcode can only access the ID of assets or applications created by previous txns in the current group.",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 64,
			"Name": "bnz",
			"Args": "U",
			"Cost": 1,
			"Size": 3,
			"Doc": "branch to TARGET if value X is not zero",
			"DocExtra": "The `bnz` instruction opcode 0x40 is followed by two immediate data bytes which are a high byte first and low byte second which together form a 16 bit offset which the instruction may branch to. For a bnz instruction at `pc`, if the last element of the stack is not zero then branch to instruction at `pc + 3 + N`, else proceed to next instruction at `pc + 3`. Branch targets must be well aligned instructions. (e.g. Branching to the second byte of a 2 byte op will be rejected.) Branch offsets are limited to forward branches only, 0-0x7fff until v4. v4 treats offset as a signed 16 bit integer allowing for backward branches and looping.At LogicSigVersion 2 it became allowed to branch to the end of the program exactly after the last instruction: bnz to byte N (with 0-indexing) was illegal for a TEAL program with N bytes before LogicSigVersion 2, and is legal after it. This change eliminates the need for a last instruction of no-op as a branch target at the end. (Branching beyond the end--in other words, to a byte larger than N--is still illegal and will cause the program to fail.)",
			"ImmediateNote": "{int16 branch offset, big endian. (negative offsets are illegal before v4)}",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 65,
			"Name": "bz",
			"Args": "U",
			"Cost": 1,
			"Size": 3,
			"Doc": "branch to TARGET if value X is zero",
			"DocExtra": "See `bnz` for details on how branches work. `bz` inverts the behavior of `bnz`.",
			"ImmediateNote": "{int16 branch offset, big endian. (negative offsets are illegal before v4)}",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 66,
			"Name": "b",
			"Cost": 1,
			"Size": 3,
			"Doc": "branch unconditionally to TARGET",
			"DocExtra": "See `bnz` for details on how branches work. `b` always jumps to the offset.",
			"ImmediateNote": "{int16 branch offset, big endian. (negative offsets are illegal before v4)}",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 67,
			"Name": "return",
			"Args": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "use last value on stack as success value; end",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 68,
			"Name": "assert",
			"Args": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "immediately fail unless value X is a non-zero number",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 72,
			"Name": "pop",
			"Args": ".",
			"Cost": 1,
			"Size": 1,
			"Doc": "discard value X from stack",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 73,
			"Name": "dup",
			"Args": ".",
			"Returns": "..",
			"Cost": 1,
			"Size": 1,
			"Doc": "duplicate last value on stack",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 74,
			"Name": "dup2",
			"Args": "..",
			"Returns": "....",
			"Cost": 1,
			"Size": 1,
			"Doc": "duplicate two last values on stack: A, B -> A, B, A, B",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 75,
			"Name": "dig",
			"Args": ".",
			"Returns": "..",
			"Cost": 1,
			"Size": 2,
			"Doc": "push the Nth value from the top of the stack. dig 0 is equivalent to dup",
			"ImmediateNote": "{uint8 depth}",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 76,
			"Name": "swap",
			"Args": "..",
			"Returns": "..",
			"Cost": 1,
			"Size": 1,
			"Doc": "swaps two last values on stack: A, B -> B, A",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 77,
			"Name": "select",
			"Args": "..U",
			"Returns": ".",
			"Cost": 1,
			"Size": 1,
			"Doc": "selects one of two values based on top-of-stack: A, B, C -> (if C != 0 then B else A)",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 80,
			"Name": "concat",
			"Args": "BB",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop two byte-arrays A and B and join them, push the result",
			"DocExtra": "`concat` panics if the result would be greater than 4096 bytes.",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 81,
			"Name": "substring",
			"Args": "B",
			"Returns": "B",
			"Cost": 1,
			"Size": 3,
			"Doc": "pop a byte-array A. For immediate values in 0..255 S and E: extract a range of bytes from A starting at S up to but not including E, push the substring result. If E < S, or either is larger than the array length, the program fails",
			"ImmediateNote": "{uint8 start position} {uint8 end position}",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 82,
			"Name": "substring3",
			"Args": "BUU",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop a byte-array A and two integers B and C. Extract a range of bytes from A starting at B up to but not including C, push the substring result. If C < B, or either is larger than the array length, the program fails",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 83,
			"Name": "getbit",
			"Args": ".U",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop a target A (integer or byte-array), and index B. Push the Bth bit of A.",
			"DocExtra": "see explanation of bit ordering in setbit",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 84,
			"Name": "setbit",
			"Args": ".UU",
			"Returns": ".",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop a target A, index B, and bit C. Set the Bth bit of A to C, and push the result",
			"DocExtra": "bit indexing begins with low-order bits in integers. Setting bit 4 to 1 on the integer 0 yields 16 (`int 0x0010`, or 2^4). Indexing begins in the first bytes of a byte-string (as seen in getbyte and substring). Setting bits 0 through 11 to 1 in a 4 byte-array of 0s yields `byte 0xfff00000`",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 85,
			"Name": "getbyte",
			"Args": "BU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop a byte-array A and integer B. Extract the Bth byte of A and push it as an integer",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 86,
			"Name": "setbyte",
			"Args": "BUU",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop a byte-array A, integer B, and small integer C (between 0..255). Set the Bth byte of A to C, and push the result",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 96,
			"Name": "balance",
			"Args": ".",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "get balance account A, in microalgos. The balance is observed after the effects of previous transactions in the group, and after the fee for the current transaction is deducted.",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender). Return: value.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 97,
			"Name": "app_opted_in",
			"Args": ".U",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "check if account A opted in for the application B => {0 or 1}",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), application id (or, since v4, a Txn.ForeignApps offset). Return: 1 if opted in and 0 otherwise.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 98,
			"Name": "app_local_get",
			"Args": ".B",
			"Returns": ".",
			"Cost": 1,
			"Size": 1,
			"Doc": "read from account A from local state of the current application key B => value",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), state key. Return: value. The value is zero (of type uint64) if the key does not exist.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 99,
			"Name": "app_local_get_ex",
			"Args": ".UB",
			"Returns": ".U",
			"Cost": 1,
			"Size": 1,
			"Doc": "read from account A from local state of the application B key C => [*... stack*, value, 0 or 1]",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), application id (or, since v4, a Txn.ForeignApps offset), state key. Return: did_exist flag (top of the stack, 1 if exist and 0 otherwise), value. The value is zero (of type uint64) if the key does not exist.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 100,
			"Name": "app_global_get",
			"Args": "B",
			"Returns": ".",
			"Cost": 1,
			"Size": 1,
			"Doc": "read key A from global state of a current application => value",
			"DocExtra": "params: state key. Return: value. The value is zero (of type uint64) if the key does not exist.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 101,
			"Name": "app_global_get_ex",
			"Args": "UB",
			"Returns": ".U",
			"Cost": 1,
			"Size": 1,
			"Doc": "read from application A global state key B => [*... stack*, value, 0 or 1]",
			"DocExtra": "params: Txn.ForeignApps offset (or, since v4, an application id that appears in Txn.ForeignApps or is the CurrentApplicationID), state key. Return: did_exist flag (top of the stack, 1 if exist and 0 otherwise), value. The value is zero (of type uint64) if the key does not exist.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 102,
			"Name": "app_local_put",
			"Args": ".B.",
			"Cost": 1,
			"Size": 1,
			"Doc": "write to account specified by A to local state of a current application key B with value C",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), state key, value.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 103,
			"Name": "app_global_put",
			"Args": "B.",
			"Cost": 1,
			"Size": 1,
			"Doc": "write key A and value B to global state of the current application",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 104,
			"Name": "app_local_del",
			"Args": ".B",
			"Cost": 1,
			"Size": 1,
			"Doc": "delete from account A local state key B of the current application",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), state key.Deleting a key which is already absent has no effect on the application local state. (In particular, it does _not_ cause the program to fail.)",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 105,
			"Name": "app_global_del",
			"Args": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "delete key A from a global state of the current application",
			"DocExtra": "params: state key.Deleting a key which is already absent has no effect on the application global state. (In particular, it does _not_ cause the program to fail.)",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 112,
			"Name": "asset_holding_get",
			"Args": ".U",
			"Returns": ".U",
			"Cost": 1,
			"Size": 2,
			"ArgEnum": [
				"AssetBalance",
				"AssetFrozen"
			],
			"ArgEnumTypes": "UU",
			"Doc": "read from account A and asset B holding field X (imm arg) => {0 or 1 (top), value}",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender), asset id (or, since v4, a Txn.ForeignAssets offset). Return: did_exist flag (1 if exist and 0 otherwise), value.",
			"ImmediateNote": "{uint8 asset holding field index}",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 113,
			"Name": "asset_params_get",
			"Args": "U",
			"Returns": ".U",
			"Cost": 1,
			"Size": 2,
			"ArgEnum": [
				"AssetTotal",
				"AssetDecimals",
				"AssetDefaultFrozen",
				"AssetUnitName",
				"AssetName",
				"AssetURL",
				"AssetMetadataHash",
				"AssetManager",
				"AssetReserve",
				"AssetFreeze",
				"AssetClawback"
			],
			"ArgEnumTypes": "UUUBBBBBBBB",
			"Doc": "read from asset A params field X (imm arg) => {0 or 1 (top), value}",
			"DocExtra": "params: Txn.ForeignAssets offset (or, since v4, an asset id that appears in Txn.ForeignAssets). Return: did_exist flag (1 if exist and 0 otherwise), value.",
			"ImmediateNote": "{uint8 asset params field index}",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 120,
			"Name": "min_balance",
			"Args": ".",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "get minimum required balance account A, in microalgos. Required balance is affected by [ASA](https://developer.algorand.org/docs/features/asa/#assets-overview) and [App](https://developer.algorand.org/docs/features/asc1/stateful/#minimum-balance-requirement-for-a-smart-contract) usage. When creating or opting into an app, the minimum balance grows before the app code runs, therefore the increase is visible there. When deleting or closing out, the minimum balance decreases after the app executes.",
			"DocExtra": "params: Txn.Accounts offset (or, since v4, an account address that appears in Txn.Accounts or is Txn.Sender). Return: value.",
			"Groups": [
				"State Access"
			]
		},
		{
			"Opcode": 128,
			"Name": "pushbytes",
			"Returns": "B",
			"Cost": 1,
			"Size": 0,
			"Doc": "push the following program bytes to the stack",
			"DocExtra": "pushbytes args are not added to the bytecblock during assembly processes",
			"ImmediateNote": "{varuint length} {bytes}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 129,
			"Name": "pushint",
			"Returns": "U",
			"Cost": 1,
			"Size": 0,
			"Doc": "push immediate UINT to the stack as an integer",
			"DocExtra": "pushint args are not added to the intcblock during assembly processes",
			"ImmediateNote": "{varuint int}",
			"Groups": [
				"Loading Values"
			]
		},
		{
			"Opcode": 136,
			"Name": "callsub",
			"Cost": 1,
			"Size": 3,
			"Doc": "branch unconditionally to TARGET, saving the next instruction on the call stack",
			"DocExtra": "The call stack is separate from the data stack. Only `callsub` and `retsub` manipulate it.`",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 137,
			"Name": "retsub",
			"Cost": 1,
			"Size": 1,
			"Doc": "pop the top instruction from the call stack and branch to it",
			"DocExtra": "The call stack is separate from the data stack. Only `callsub` and `retsub` manipulate it.`",
			"Groups": [
				"Flow Control"
			]
		},
		{
			"Opcode": 144,
			"Name": "shl",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A times 2^B, modulo 2^64",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 145,
			"Name": "shr",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A divided by 2^B",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 146,
			"Name": "sqrt",
			"Args": "U",
			"Returns": "U",
			"Cost": 4,
			"Size": 1,
			"Doc": "The largest integer X such that X^2 <= A",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 147,
			"Name": "bitlen",
			"Args": ".",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "The index of the highest bit in A. If A is a byte-array, it is interpreted as a big-endian unsigned integer",
			"DocExtra": "bitlen interprets arrays as big-endian integers, unlike setbit/getbit",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 148,
			"Name": "exp",
			"Args": "UU",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A raised to the Bth power. Panic if A == B == 0 and on overflow",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 149,
			"Name": "expw",
			"Args": "UU",
			"Returns": "UU",
			"Cost": 10,
			"Size": 1,
			"Doc": "A raised to the Bth power as a 128-bit long result as low (top) and high uint64 values on the stack. Panic if A == B == 0 or if the results exceeds 2^128-1",
			"Groups": [
				"Arithmetic"
			]
		},
		{
			"Opcode": 160,
			"Name": "b+",
			"Args": "BB",
			"Returns": "B",
			"Cost": 10,
			"Size": 1,
			"Doc": "A plus B, where A and B are byte-arrays interpreted as big-endian unsigned integers",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 161,
			"Name": "b-",
			"Args": "BB",
			"Returns": "B",
			"Cost": 10,
			"Size": 1,
			"Doc": "A minus B, where A and B are byte-arrays interpreted as big-endian unsigned integers. Panic on underflow.",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 162,
			"Name": "b/",
			"Args": "BB",
			"Returns": "B",
			"Cost": 20,
			"Size": 1,
			"Doc": "A divided by B, where A and B are byte-arrays interpreted as big-endian unsigned integers. Panic if B is zero.",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 163,
			"Name": "b*",
			"Args": "BB",
			"Returns": "B",
			"Cost": 20,
			"Size": 1,
			"Doc": "A times B, where A and B are byte-arrays interpreted as big-endian unsigned integers.",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 164,
			"Name": "b<",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is less than B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 165,
			"Name": "b>",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is greater than B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 166,
			"Name": "b<=",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is less than or equal to B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 167,
			"Name": "b>=",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is greater than or equal to B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 168,
			"Name": "b==",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is equals to B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 169,
			"Name": "b!=",
			"Args": "BB",
			"Returns": "U",
			"Cost": 1,
			"Size": 1,
			"Doc": "A is not equal to B, where A and B are byte-arrays interpreted as big-endian unsigned integers => { 0 or 1}",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 170,
			"Name": "b%",
			"Args": "BB",
			"Returns": "B",
			"Cost": 20,
			"Size": 1,
			"Doc": "A modulo B, where A and B are byte-arrays interpreted as big-endian unsigned integers. Panic if B is zero.",
			"Groups": [
				"Byteslice Arithmetic"
			]
		},
		{
			"Opcode": 171,
			"Name": "b|",
			"Args": "BB",
			"Returns": "B",
			"Cost": 6,
			"Size": 1,
			"Doc": "A bitwise-or B, where A and B are byte-arrays, zero-left extended to the greater of their lengths",
			"Groups": [
				"Byteslice Logic"
			]
		},
		{
			"Opcode": 172,
			"Name": "b&",
			"Args": "BB",
			"Returns": "B",
			"Cost": 6,
			"Size": 1,
			"Doc": "A bitwise-and B, where A and B are byte-arrays, zero-left extended to the greater of their lengths",
			"Groups": [
				"Byteslice Logic"
			]
		},
		{
			"Opcode": 173,
			"Name": "b^",
			"Args": "BB",
			"Returns": "B",
			"Cost": 6,
			"Size": 1,
			"Doc": "A bitwise-xor B, where A and B are byte-arrays, zero-left extended to the greater of their lengths",
			"Groups": [
				"Byteslice Logic"
			]
		},
		{
			"Opcode": 174,
			"Name": "b~",
			"Args": "B",
			"Returns": "B",
			"Cost": 4,
			"Size": 1,
			"Doc": "A with all bits inverted",
			"Groups": [
				"Byteslice Logic"
			]
		},
		{
			"Opcode": 175,
			"Name": "bzero",
			"Args": "U",
			"Returns": "B",
			"Cost": 1,
			"Size": 1,
			"Doc": "push a byte-array of length A, containing all zero bytes",
			"Groups": [
				"Loading Values"
			]
		}
	]
}
''';
