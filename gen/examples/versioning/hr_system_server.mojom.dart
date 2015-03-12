// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library hr_system_server.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;

final int Department_SALES = 0;
final int Department_DEV = Department_SALES + 1;


class Date extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int year = 0;
  int month = 0;
  int day = 0;

  Date() : super(kStructSize);

  static Date deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Date decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Date result = new Date();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.year = decoder0.decodeUint16(8);
    }
    {
      
      result.month = decoder0.decodeUint8(10);
    }
    {
      
      result.day = decoder0.decodeUint8(11);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(year, 8);
    
    encoder0.encodeUint8(month, 10);
    
    encoder0.encodeUint8(day, 11);
  }

  String toString() {
    return "Date("
           "year: $year" ", "
           "month: $month" ", "
           "day: $day" ")";
  }
}

class Employee extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int employeeId = 0;
  String name = null;
  int department = 0;
  Date birthday = null;

  Employee() : super(kStructSize);

  static Employee deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Employee decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Employee result = new Employee();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.employeeId = decoder0.decodeUint64(8);
    }
    {
      
      result.name = decoder0.decodeString(16, false);
    }
    {
      
      result.department = decoder0.decodeInt32(24);
    }
    {
      
      var decoder1 = decoder0.decodePointer(32, true);
      result.birthday = Date.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(employeeId, 8);
    
    encoder0.encodeString(name, 16, false);
    
    encoder0.encodeInt32(department, 24);
    
    encoder0.encodeStruct(birthday, 32, true);
  }

  String toString() {
    return "Employee("
           "employeeId: $employeeId" ", "
           "name: $name" ", "
           "department: $department" ", "
           "birthday: $birthday" ")";
  }
}

class HumanResourceDatabaseAddEmployeeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Employee employee = null;

  HumanResourceDatabaseAddEmployeeParams() : super(kStructSize);

  static HumanResourceDatabaseAddEmployeeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HumanResourceDatabaseAddEmployeeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseAddEmployeeParams result = new HumanResourceDatabaseAddEmployeeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.employee = Employee.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(employee, 8, false);
  }

  String toString() {
    return "HumanResourceDatabaseAddEmployeeParams("
           "employee: $employee" ")";
  }
}

class HumanResourceDatabaseAddEmployeeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  HumanResourceDatabaseAddEmployeeResponseParams() : super(kStructSize);

  static HumanResourceDatabaseAddEmployeeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HumanResourceDatabaseAddEmployeeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseAddEmployeeResponseParams result = new HumanResourceDatabaseAddEmployeeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }

  String toString() {
    return "HumanResourceDatabaseAddEmployeeResponseParams("
           "success: $success" ")";
  }
}

class HumanResourceDatabaseQueryEmployeeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int id = 0;

  HumanResourceDatabaseQueryEmployeeParams() : super(kStructSize);

  static HumanResourceDatabaseQueryEmployeeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HumanResourceDatabaseQueryEmployeeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseQueryEmployeeParams result = new HumanResourceDatabaseQueryEmployeeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeUint64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(id, 8);
  }

  String toString() {
    return "HumanResourceDatabaseQueryEmployeeParams("
           "id: $id" ")";
  }
}

class HumanResourceDatabaseQueryEmployeeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Employee employee = null;

  HumanResourceDatabaseQueryEmployeeResponseParams() : super(kStructSize);

  static HumanResourceDatabaseQueryEmployeeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HumanResourceDatabaseQueryEmployeeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseQueryEmployeeResponseParams result = new HumanResourceDatabaseQueryEmployeeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.employee = Employee.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(employee, 8, true);
  }

  String toString() {
    return "HumanResourceDatabaseQueryEmployeeResponseParams("
           "employee: $employee" ")";
  }
}
const int kHumanResourceDatabase_addEmployee_name = 0;
const int kHumanResourceDatabase_queryEmployee_name = 1;

const String HumanResourceDatabaseName =
      'mojo::examples::HumanResourceDatabase';

abstract class HumanResourceDatabase {
  Future<HumanResourceDatabaseAddEmployeeResponseParams> addEmployee(Employee employee,[Function responseFactory = null]);
  Future<HumanResourceDatabaseQueryEmployeeResponseParams> queryEmployee(int id,[Function responseFactory = null]);

}


class HumanResourceDatabaseProxyImpl extends bindings.Proxy {
  HumanResourceDatabaseProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  HumanResourceDatabaseProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HumanResourceDatabaseProxyImpl.unbound() : super.unbound();

  static HumanResourceDatabaseProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HumanResourceDatabaseProxyImpl.fromEndpoint(endpoint);

  String get name => HumanResourceDatabaseName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kHumanResourceDatabase_addEmployee_name:
        var r = HumanResourceDatabaseAddEmployeeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kHumanResourceDatabase_queryEmployee_name:
        var r = HumanResourceDatabaseQueryEmployeeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "HumanResourceDatabaseProxyImpl($superString)";
  }
}


class _HumanResourceDatabaseProxyCalls implements HumanResourceDatabase {
  HumanResourceDatabaseProxyImpl _proxyImpl;

  _HumanResourceDatabaseProxyCalls(this._proxyImpl);
    Future<HumanResourceDatabaseAddEmployeeResponseParams> addEmployee(Employee employee,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new HumanResourceDatabaseAddEmployeeParams();
      params.employee = employee;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kHumanResourceDatabase_addEmployee_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<HumanResourceDatabaseQueryEmployeeResponseParams> queryEmployee(int id,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new HumanResourceDatabaseQueryEmployeeParams();
      params.id = id;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kHumanResourceDatabase_queryEmployee_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class HumanResourceDatabaseProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  HumanResourceDatabase ptr;
  final String name = HumanResourceDatabaseName;

  HumanResourceDatabaseProxy(HumanResourceDatabaseProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _HumanResourceDatabaseProxyCalls(proxyImpl);

  HumanResourceDatabaseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new HumanResourceDatabaseProxyImpl.fromEndpoint(endpoint) {
    ptr = new _HumanResourceDatabaseProxyCalls(impl);
  }

  HumanResourceDatabaseProxy.fromHandle(core.MojoHandle handle) :
      impl = new HumanResourceDatabaseProxyImpl.fromHandle(handle) {
    ptr = new _HumanResourceDatabaseProxyCalls(impl);
  }

  HumanResourceDatabaseProxy.unbound() :
      impl = new HumanResourceDatabaseProxyImpl.unbound() {
    ptr = new _HumanResourceDatabaseProxyCalls(impl);
  }

  static HumanResourceDatabaseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HumanResourceDatabaseProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "HumanResourceDatabaseProxy($impl)";
  }
}


class HumanResourceDatabaseStub extends bindings.Stub {
  HumanResourceDatabase _impl = null;

  HumanResourceDatabaseStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  HumanResourceDatabaseStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  HumanResourceDatabaseStub.unbound() : super.unbound();

  static HumanResourceDatabaseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HumanResourceDatabaseStub.fromEndpoint(endpoint);

  static const String name = HumanResourceDatabaseName;


  HumanResourceDatabaseAddEmployeeResponseParams _HumanResourceDatabaseAddEmployeeResponseParamsFactory(bool success) {
    var result = new HumanResourceDatabaseAddEmployeeResponseParams();
    result.success = success;
    return result;
  }
  HumanResourceDatabaseQueryEmployeeResponseParams _HumanResourceDatabaseQueryEmployeeResponseParamsFactory(Employee employee) {
    var result = new HumanResourceDatabaseQueryEmployeeResponseParams();
    result.employee = employee;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kHumanResourceDatabase_addEmployee_name:
        var params = HumanResourceDatabaseAddEmployeeParams.deserialize(
            message.payload);
        return _impl.addEmployee(params.employee,_HumanResourceDatabaseAddEmployeeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kHumanResourceDatabase_addEmployee_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kHumanResourceDatabase_queryEmployee_name:
        var params = HumanResourceDatabaseQueryEmployeeParams.deserialize(
            message.payload);
        return _impl.queryEmployee(params.id,_HumanResourceDatabaseQueryEmployeeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kHumanResourceDatabase_queryEmployee_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  HumanResourceDatabase get impl => _impl;
      set impl(HumanResourceDatabase d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "HumanResourceDatabaseStub($superString)";
  }
}


