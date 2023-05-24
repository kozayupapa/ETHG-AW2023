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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("TokenCount")));
bytes32 constant TokenCountTableId = _tableId;

struct TokenCountData {
  uint256 total;
  uint256 used;
  uint256 vacant;
}

library TokenCount {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.UINT256;
    _schema[1] = SchemaType.UINT256;
    _schema[2] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "total";
    _fieldNames[1] = "used";
    _fieldNames[2] = "vacant";
    return ("TokenCount", _fieldNames);
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

  /** Get total */
  function getTotal(address ka) internal view returns (uint256 total) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get total (using the specified store) */
  function getTotal(IStore _store, address ka) internal view returns (uint256 total) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set total */
  function setTotal(address ka, uint256 total) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((total)));
  }

  /** Set total (using the specified store) */
  function setTotal(IStore _store, address ka, uint256 total) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((total)));
  }

  /** Get used */
  function getUsed(address ka) internal view returns (uint256 used) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get used (using the specified store) */
  function getUsed(IStore _store, address ka) internal view returns (uint256 used) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set used */
  function setUsed(address ka, uint256 used) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((used)));
  }

  /** Set used (using the specified store) */
  function setUsed(IStore _store, address ka, uint256 used) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((used)));
  }

  /** Get vacant */
  function getVacant(address ka) internal view returns (uint256 vacant) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get vacant (using the specified store) */
  function getVacant(IStore _store, address ka) internal view returns (uint256 vacant) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set vacant */
  function setVacant(address ka, uint256 vacant) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((vacant)));
  }

  /** Set vacant (using the specified store) */
  function setVacant(IStore _store, address ka, uint256 vacant) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((vacant)));
  }

  /** Get the full data */
  function get(address ka) internal view returns (TokenCountData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, address ka) internal view returns (TokenCountData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(address ka, uint256 total, uint256 used, uint256 vacant) internal {
    bytes memory _data = encode(total, used, vacant);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, address ka, uint256 total, uint256 used, uint256 vacant) internal {
    bytes memory _data = encode(total, used, vacant);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(address ka, TokenCountData memory _table) internal {
    set(ka, _table.total, _table.used, _table.vacant);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, address ka, TokenCountData memory _table) internal {
    set(_store, ka, _table.total, _table.used, _table.vacant);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (TokenCountData memory _table) {
    _table.total = (uint256(Bytes.slice32(_blob, 0)));

    _table.used = (uint256(Bytes.slice32(_blob, 32)));

    _table.vacant = (uint256(Bytes.slice32(_blob, 64)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(uint256 total, uint256 used, uint256 vacant) internal view returns (bytes memory) {
    return abi.encodePacked(total, used, vacant);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address ka) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
  }

  /* Delete all data for given keys */
  function deleteRecord(address ka) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address ka) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}