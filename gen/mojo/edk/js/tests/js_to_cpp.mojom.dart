// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library js_to_cpp.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class EchoArgs extends bindings.Struct {
  static const int kStructSize = 104;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 18);
  int si64 = 0;
  int si32 = 0;
  int si16 = 0;
  int si8 = 0;
  int ui8 = 0;
  int ui64 = 0;
  int ui32 = 0;
  int ui16 = 0;
  double floatVal = 0.0;
  double floatInf = 0.0;
  double floatNan = 0.0;
  core.MojoMessagePipeEndpoint messageHandle = null;
  double doubleVal = 0.0;
  double doubleInf = 0.0;
  double doubleNan = 0.0;
  String name = null;
  List<String> stringArray = null;
  core.MojoDataPipeConsumer dataHandle = null;

  EchoArgs() : super(kStructSize);

  static EchoArgs deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoArgs decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoArgs result = new EchoArgs();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 18)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.si64 = decoder0.decodeInt64(8);
    }
    {
      
      result.si32 = decoder0.decodeInt32(16);
    }
    {
      
      result.si16 = decoder0.decodeInt16(20);
    }
    {
      
      result.si8 = decoder0.decodeInt8(22);
    }
    {
      
      result.ui8 = decoder0.decodeUint8(23);
    }
    {
      
      result.ui64 = decoder0.decodeUint64(24);
    }
    {
      
      result.ui32 = decoder0.decodeUint32(32);
    }
    {
      
      result.ui16 = decoder0.decodeUint16(36);
    }
    {
      
      result.floatVal = decoder0.decodeFloat(40);
    }
    {
      
      result.floatInf = decoder0.decodeFloat(44);
    }
    {
      
      result.floatNan = decoder0.decodeFloat(48);
    }
    {
      
      result.messageHandle = decoder0.decodeMessagePipeHandle(52, true);
    }
    {
      
      result.doubleVal = decoder0.decodeDouble(56);
    }
    {
      
      result.doubleInf = decoder0.decodeDouble(64);
    }
    {
      
      result.doubleNan = decoder0.decodeDouble(72);
    }
    {
      
      result.name = decoder0.decodeString(80, true);
    }
    {
      
      var decoder1 = decoder0.decodePointer(88, true);
      if (decoder1 == null) {
        result.stringArray = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.stringArray = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.stringArray[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.dataHandle = decoder0.decodeConsumerHandle(96, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(si64, 8);
    
    encoder0.encodeInt32(si32, 16);
    
    encoder0.encodeInt16(si16, 20);
    
    encoder0.encodeInt8(si8, 22);
    
    encoder0.encodeUint8(ui8, 23);
    
    encoder0.encodeUint64(ui64, 24);
    
    encoder0.encodeUint32(ui32, 32);
    
    encoder0.encodeUint16(ui16, 36);
    
    encoder0.encodeFloat(floatVal, 40);
    
    encoder0.encodeFloat(floatInf, 44);
    
    encoder0.encodeFloat(floatNan, 48);
    
    encoder0.encodeMessagePipeHandle(messageHandle, 52, true);
    
    encoder0.encodeDouble(doubleVal, 56);
    
    encoder0.encodeDouble(doubleInf, 64);
    
    encoder0.encodeDouble(doubleNan, 72);
    
    encoder0.encodeString(name, 80, true);
    
    if (stringArray == null) {
      encoder0.encodeNullPointer(88, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(stringArray.length, 88, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < stringArray.length; ++i0) {
        
        encoder1.encodeString(stringArray[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeConsumerHandle(dataHandle, 96, true);
  }
}

class EchoArgsList extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  EchoArgsList next = null;
  EchoArgs item = null;

  EchoArgsList() : super(kStructSize);

  static EchoArgsList deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoArgsList decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoArgsList result = new EchoArgsList();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.next = EchoArgsList.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.item = EchoArgs.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(next, 8, true);
    
    encoder0.encodeStruct(item, 16, true);
  }
}

class CppSideStartTestParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CppSideStartTestParams() : super(kStructSize);

  static CppSideStartTestParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSideStartTestParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSideStartTestParams result = new CppSideStartTestParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class CppSideTestFinishedParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CppSideTestFinishedParams() : super(kStructSize);

  static CppSideTestFinishedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSideTestFinishedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSideTestFinishedParams result = new CppSideTestFinishedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class CppSidePingResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CppSidePingResponseParams() : super(kStructSize);

  static CppSidePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSidePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSidePingResponseParams result = new CppSidePingResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class CppSideEchoResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EchoArgsList list = null;

  CppSideEchoResponseParams() : super(kStructSize);

  static CppSideEchoResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSideEchoResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSideEchoResponseParams result = new CppSideEchoResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.list = EchoArgsList.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(list, 8, false);
  }
}

class CppSideBitFlipResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EchoArgsList arg = null;

  CppSideBitFlipResponseParams() : super(kStructSize);

  static CppSideBitFlipResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSideBitFlipResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSideBitFlipResponseParams result = new CppSideBitFlipResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.arg = EchoArgsList.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(arg, 8, false);
  }
}

class CppSideBackPointerResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EchoArgsList arg = null;

  CppSideBackPointerResponseParams() : super(kStructSize);

  static CppSideBackPointerResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CppSideBackPointerResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CppSideBackPointerResponseParams result = new CppSideBackPointerResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.arg = EchoArgsList.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(arg, 8, false);
  }
}

class JsSideSetCppSideParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object cpp = null;

  JsSideSetCppSideParams() : super(kStructSize);

  static JsSideSetCppSideParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static JsSideSetCppSideParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    JsSideSetCppSideParams result = new JsSideSetCppSideParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.cpp = decoder0.decodeServiceInterface(8, false, CppSideProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(cpp, 8, false);
  }
}

class JsSidePingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  JsSidePingParams() : super(kStructSize);

  static JsSidePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static JsSidePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    JsSidePingParams result = new JsSidePingParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class JsSideEchoParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int numIterations = 0;
  EchoArgs arg = null;

  JsSideEchoParams() : super(kStructSize);

  static JsSideEchoParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static JsSideEchoParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    JsSideEchoParams result = new JsSideEchoParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.numIterations = decoder0.decodeInt32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.arg = EchoArgs.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(numIterations, 8);
    
    encoder0.encodeStruct(arg, 16, false);
  }
}

class JsSideBitFlipParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EchoArgs arg = null;

  JsSideBitFlipParams() : super(kStructSize);

  static JsSideBitFlipParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static JsSideBitFlipParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    JsSideBitFlipParams result = new JsSideBitFlipParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.arg = EchoArgs.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(arg, 8, false);
  }
}

class JsSideBackPointerParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EchoArgs arg = null;

  JsSideBackPointerParams() : super(kStructSize);

  static JsSideBackPointerParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static JsSideBackPointerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    JsSideBackPointerParams result = new JsSideBackPointerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.arg = EchoArgs.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(arg, 8, false);
  }
}
const int kCppSide_startTest_name = 88888888;
const int kCppSide_testFinished_name = 99999999;
const int kCppSide_pingResponse_name = 100000000;
const int kCppSide_echoResponse_name = 100000001;
const int kCppSide_bitFlipResponse_name = 100000002;
const int kCppSide_backPointerResponse_name = 100000003;

abstract class CppSide implements core.Listener {
  static const String name = 'js_to_cpp::CppSide';
  CppSideStub stub;

  CppSide(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CppSideStub(endpoint);

  CppSide.fromHandle(core.MojoHandle handle) :
      stub = new CppSideStub.fromHandle(handle);

  CppSide.fromStub(this.stub);

  CppSide.unbound() :
      stub = new CppSideStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CppSide get delegate => stub.delegate;
  set delegate(CppSide d) {
    stub.delegate = d;
  }
  void startTest();
  void testFinished();
  void pingResponse();
  void echoResponse(EchoArgsList list);
  void bitFlipResponse(EchoArgsList arg);
  void backPointerResponse(EchoArgsList arg);

}

class CppSideProxy extends bindings.Proxy implements CppSide {
  CppSideProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CppSideProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CppSideProxy.unbound() : super.unbound();

  String get name => CppSide.name;

  static CppSideProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CppSideProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void startTest() {
    var params = new CppSideStartTestParams();
    sendMessage(params, kCppSide_startTest_name);
  }

  void testFinished() {
    var params = new CppSideTestFinishedParams();
    sendMessage(params, kCppSide_testFinished_name);
  }

  void pingResponse() {
    var params = new CppSidePingResponseParams();
    sendMessage(params, kCppSide_pingResponse_name);
  }

  void echoResponse(EchoArgsList list) {
    var params = new CppSideEchoResponseParams();
    params.list = list;
    sendMessage(params, kCppSide_echoResponse_name);
  }

  void bitFlipResponse(EchoArgsList arg) {
    var params = new CppSideBitFlipResponseParams();
    params.arg = arg;
    sendMessage(params, kCppSide_bitFlipResponse_name);
  }

  void backPointerResponse(EchoArgsList arg) {
    var params = new CppSideBackPointerResponseParams();
    params.arg = arg;
    sendMessage(params, kCppSide_backPointerResponse_name);
  }

}

class CppSideStub extends bindings.Stub {
  CppSide _delegate = null;

  CppSideStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CppSideStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CppSideStub.unbound() : super.unbound();

  static CppSideStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CppSideStub(endpoint);

  static const String name = CppSide.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCppSide_startTest_name:
        var params = CppSideStartTestParams.deserialize(
            message.payload);
        _delegate.startTest();
        break;
      case kCppSide_testFinished_name:
        var params = CppSideTestFinishedParams.deserialize(
            message.payload);
        _delegate.testFinished();
        break;
      case kCppSide_pingResponse_name:
        var params = CppSidePingResponseParams.deserialize(
            message.payload);
        _delegate.pingResponse();
        break;
      case kCppSide_echoResponse_name:
        var params = CppSideEchoResponseParams.deserialize(
            message.payload);
        _delegate.echoResponse(params.list);
        break;
      case kCppSide_bitFlipResponse_name:
        var params = CppSideBitFlipResponseParams.deserialize(
            message.payload);
        _delegate.bitFlipResponse(params.arg);
        break;
      case kCppSide_backPointerResponse_name:
        var params = CppSideBackPointerResponseParams.deserialize(
            message.payload);
        _delegate.backPointerResponse(params.arg);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  CppSide get delegate => _delegate;
      set delegate(CppSide d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kJsSide_setCppSide_name = 0;
const int kJsSide_ping_name = 1;
const int kJsSide_echo_name = 2;
const int kJsSide_bitFlip_name = 3;
const int kJsSide_backPointer_name = 4;

abstract class JsSide implements core.Listener {
  static const String name = 'js_to_cpp::JsSide';
  JsSideStub stub;

  JsSide(core.MojoMessagePipeEndpoint endpoint) :
      stub = new JsSideStub(endpoint);

  JsSide.fromHandle(core.MojoHandle handle) :
      stub = new JsSideStub.fromHandle(handle);

  JsSide.fromStub(this.stub);

  JsSide.unbound() :
      stub = new JsSideStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  JsSide get delegate => stub.delegate;
  set delegate(JsSide d) {
    stub.delegate = d;
  }
  void setCppSide(Object cpp);
  void ping();
  void echo(int numIterations, EchoArgs arg);
  void bitFlip(EchoArgs arg);
  void backPointer(EchoArgs arg);

}

class JsSideProxy extends bindings.Proxy implements JsSide {
  JsSideProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  JsSideProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  JsSideProxy.unbound() : super.unbound();

  String get name => JsSide.name;

  static JsSideProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new JsSideProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void setCppSide(Object cpp) {
    var params = new JsSideSetCppSideParams();
    params.cpp = cpp;
    sendMessage(params, kJsSide_setCppSide_name);
  }

  void ping() {
    var params = new JsSidePingParams();
    sendMessage(params, kJsSide_ping_name);
  }

  void echo(int numIterations, EchoArgs arg) {
    var params = new JsSideEchoParams();
    params.numIterations = numIterations;
    params.arg = arg;
    sendMessage(params, kJsSide_echo_name);
  }

  void bitFlip(EchoArgs arg) {
    var params = new JsSideBitFlipParams();
    params.arg = arg;
    sendMessage(params, kJsSide_bitFlip_name);
  }

  void backPointer(EchoArgs arg) {
    var params = new JsSideBackPointerParams();
    params.arg = arg;
    sendMessage(params, kJsSide_backPointer_name);
  }

}

class JsSideStub extends bindings.Stub {
  JsSide _delegate = null;

  JsSideStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  JsSideStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  JsSideStub.unbound() : super.unbound();

  static JsSideStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new JsSideStub(endpoint);

  static const String name = JsSide.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kJsSide_setCppSide_name:
        var params = JsSideSetCppSideParams.deserialize(
            message.payload);
        _delegate.setCppSide(params.cpp);
        break;
      case kJsSide_ping_name:
        var params = JsSidePingParams.deserialize(
            message.payload);
        _delegate.ping();
        break;
      case kJsSide_echo_name:
        var params = JsSideEchoParams.deserialize(
            message.payload);
        _delegate.echo(params.numIterations, params.arg);
        break;
      case kJsSide_bitFlip_name:
        var params = JsSideBitFlipParams.deserialize(
            message.payload);
        _delegate.bitFlip(params.arg);
        break;
      case kJsSide_backPointer_name:
        var params = JsSideBackPointerParams.deserialize(
            message.payload);
        _delegate.backPointer(params.arg);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  JsSide get delegate => _delegate;
      set delegate(JsSide d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




