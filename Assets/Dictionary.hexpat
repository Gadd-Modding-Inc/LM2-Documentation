/*
Dictionary Pattern File, by VTXG.
For both Luigi's Mansion 2 and Luigi's Mansion 2 HD.

https://github.com/Gadd-Modding-Inc/LM2-Documentation
*/

struct NTString {
    char String[];
};

struct TableReference {
    u32 Hash;
    u8 BlockIndices[8];
};

struct TableInfo {
    u16 ChunkCount;
    u16 TableIndex;
};

struct BlockHeader {
    u32 Offset;
    u32 DecompressedSize;
    u32 CompressedSize;
    u8 UsageType;
    padding[1];
    u8 FileExtension;
    u8 Unknown;
};

struct DictionaryFile {
    u32 Identifier;
    u16 Flags;
    bool IsCompressed;
    padding[1];
    u32 BlockCount;
    u32 MaxCompressedBlockSize;
    u8 TableInfoCount;
    padding[1];
    u8 TableRefCount;
    u8 FileExtensionCount;
    
    TableReference TableReferences[TableRefCount];
    TableInfo TableInfos[TableRefCount * TableInfoCount];
    BlockHeader BlockHeaders[BlockCount];
    
    NTString FileExtensions[FileExtensionCount];
};

DictionaryFile Dictionary @ 0x00;