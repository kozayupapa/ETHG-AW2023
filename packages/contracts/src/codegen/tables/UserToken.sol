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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("UserToken")));
bytes32 constant UserTokenTableId = _tableId;

struct UserTokenData {
  address token;
  address owner;
  int32 count;
}

library UserToken {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.ADDRESS;
    _schema[2] = SchemaType.INT32;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "token";
    _fieldNames[1] = "owner";
    _fieldNames[2] = "count";
    return ("UserToken", _fieldNames);
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

  /** Get token */
  function getToken(address ka, address ko) internal view returns (address token) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get token (using the specified store) */
  function getToken(IStore _store, address ka, address ko) internal view returns (address token) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set token */
  function setToken(address ka, address ko, address token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((token)));
  }

  /** Set token (using the specified store) */
  function setToken(IStore _store, address ka, address ko, address token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((token)));
  }

  /** Get owner */
  function getOwner(address ka, address ko) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, address ka, address ko) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set owner */
  function setOwner(address ka, address ko, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((owner)));
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, address ka, address ko, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((owner)));
  }

  /** Get count */
  function getCount(address ka, address ko) internal view returns (int32 count) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Get count (using the specified store) */
  function getCount(IStore _store, address ka, address ko) internal view returns (int32 count) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (int32(uint32(Bytes.slice4(_blob, 0))));
  }

  /** Set count */
  function setCount(address ka, address ko, int32 count) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((count)));
  }

  /** Set count (using the specified store) */
  function setCount(IStore _store, address ka, address ko, int32 count) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((count)));
  }

  /** Get the full data */
  function get(address ka, address ko) internal view returns (UserTokenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, address ka, address ko) internal view returns (UserTokenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(address ka, address ko, address token, address owner, int32 count) internal {
    bytes memory _data = encode(token, owner, count);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, address ka, address ko, address token, address owner, int32 count) internal {
    bytes memory _data = encode(token, owner, count);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(address ka, address ko, UserTokenData memory _table) internal {
    set(ka, ko, _table.token, _table.owner, _table.count);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, address ka, address ko, UserTokenData memory _table) internal {
    set(_store, ka, ko, _table.token, _table.owner, _table.count);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (UserTokenData memory _table) {
    _table.token = (address(Bytes.slice20(_blob, 0)));

    _table.owner = (address(Bytes.slice20(_blob, 20)));

    _table.count = (int32(uint32(Bytes.slice4(_blob, 40))));
  }

  /** Tightly pack full data using this table's schema */
  function encode(address token, address owner, int32 count) internal view returns (bytes memory) {
    return abi.encodePacked(token, owner, count);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address ka, address ko) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));
  }

  /* Delete all data for given keys */
  function deleteRecord(address ka, address ko) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address ka, address ko) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((ka))));
    _keyTuple[1] = bytes32(uint256(uint160((ko))));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
