// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Stone")));
bytes32 constant StoneTableId = _tableId;

struct StoneData {
  int32 x;
  int32 y;
  address token;
  address owner;
  string color;
}

library Stone {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](5);
    _schema[0] = SchemaType.INT32;
    _schema[1] = SchemaType.INT32;
    _schema[2] = SchemaType.ADDRESS;
    _schema[3] = SchemaType.ADDRESS;
    _schema[4] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.INT32;
    _schema[1] = SchemaType.INT32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](5);
    _fieldNames[0] = "x";
    _fieldNames[1] = "y";
    _fieldNames[2] = "token";
    _fieldNames[3] = "owner";
    _fieldNames[4] = "color";
    return ("Stone", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get x */
  function getX(int32 xk, int32 yk) internal view returns (int32 x) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Get x (using the specified store) */
  function getX(IStore _store, int32 xk, int32 yk) internal view returns (int32 x) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Set x */
  function setX(int32 xk, int32 yk, int32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((x)));
  }

  /** Set x (using the specified store) */
  function setX(IStore _store, int32 xk, int32 yk, int32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((x)));
  }

  /** Get y */
  function getY(int32 xk, int32 yk) internal view returns (int32 y) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Get y (using the specified store) */
  function getY(IStore _store, int32 xk, int32 yk) internal view returns (int32 y) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Set y */
  function setY(int32 xk, int32 yk, int32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((y)));
  }

  /** Set y (using the specified store) */
  function setY(IStore _store, int32 xk, int32 yk, int32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((y)));
  }

  /** Get token */
  function getToken(int32 xk, int32 yk) internal view returns (address token) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get token (using the specified store) */
  function getToken(IStore _store, int32 xk, int32 yk) internal view returns (address token) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set token */
  function setToken(int32 xk, int32 yk, address token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((token)));
  }

  /** Set token (using the specified store) */
  function setToken(IStore _store, int32 xk, int32 yk, address token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((token)));
  }

  /** Get owner */
  function getOwner(int32 xk, int32 yk) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, int32 xk, int32 yk) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set owner */
  function setOwner(int32 xk, int32 yk, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((owner)));
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, int32 xk, int32 yk, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((owner)));
  }

  /** Get color */
  function getColor(int32 xk, int32 yk) internal view returns (string memory color) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Get color (using the specified store) */
  function getColor(IStore _store, int32 xk, int32 yk) internal view returns (string memory color) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Set color */
  function setColor(int32 xk, int32 yk, string memory color) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setField(_tableId, _keyTuple, 4, bytes((color)));
  }

  /** Set color (using the specified store) */
  function setColor(IStore _store, int32 xk, int32 yk, string memory color) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setField(_tableId, _keyTuple, 4, bytes((color)));
  }

  /** Get the length of color */
  function lengthColor(int32 xk, int32 yk) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of color (using the specified store) */
  function lengthColor(IStore _store, int32 xk, int32 yk) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of color (unchecked, returns invalid data if index overflows) */
  function getItemColor(int32 xk, int32 yk, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of color (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemColor(IStore _store, int32 xk, int32 yk, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to color */
  function pushColor(int32 xk, int32 yk, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Push a slice to color (using the specified store) */
  function pushColor(IStore _store, int32 xk, int32 yk, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Pop a slice from color */
  function popColor(int32 xk, int32 yk) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Pop a slice from color (using the specified store) */
  function popColor(IStore _store, int32 xk, int32 yk) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Update a slice of color at `_index` */
  function updateColor(int32 xk, int32 yk, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Update a slice of color (using the specified store) at `_index` */
  function updateColor(IStore _store, int32 xk, int32 yk, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(int32 xk, int32 yk) internal view returns (StoneData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, int32 xk, int32 yk) internal view returns (StoneData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(int32 xk, int32 yk, int32 x, int32 y, address token, address owner, string memory color) internal {
    bytes memory _data = encode(x, y, token, owner, color);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    int32 xk,
    int32 yk,
    int32 x,
    int32 y,
    address token,
    address owner,
    string memory color
  ) internal {
    bytes memory _data = encode(x, y, token, owner, color);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(int32 xk, int32 yk, StoneData memory _table) internal {
    set(xk, yk, _table.x, _table.y, _table.token, _table.owner, _table.color);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, int32 xk, int32 yk, StoneData memory _table) internal {
    set(_store, xk, yk, _table.x, _table.y, _table.token, _table.owner, _table.color);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (StoneData memory _table) {
    // 48 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 48));

    _table.x = (int32(uint32(Bytes.slice4(_blob, 0))));

    _table.y = (int32(uint32(Bytes.slice4(_blob, 4))));

    _table.token = (address(Bytes.slice20(_blob, 8)));

    _table.owner = (address(Bytes.slice20(_blob, 28)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 48) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 80;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.color = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    int32 x,
    int32 y,
    address token,
    address owner,
    string memory color
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(bytes(color).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(x, y, token, owner, _encodedLengths.unwrap(), bytes((color)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(int32 xk, int32 yk) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));
  }

  /* Delete all data for given keys */
  function deleteRecord(int32 xk, int32 yk) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, int32 xk, int32 yk) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint32((xk))));
    _keyTuple[1] = bytes32(uint256(uint32((yk))));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
