// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library math_calculator.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class CalculatorClearParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CalculatorClearParams() : super(kStructSize);

  static CalculatorClearParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorClearParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorClearParams result = new CalculatorClearParams();

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

class CalculatorClearResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  double value = 0.0;

  CalculatorClearResponseParams() : super(kStructSize);

  static CalculatorClearResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorClearResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorClearResponseParams result = new CalculatorClearResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeDouble(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeDouble(value, 8);
  }
}

class CalculatorAddParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  double value = 0.0;

  CalculatorAddParams() : super(kStructSize);

  static CalculatorAddParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorAddParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorAddParams result = new CalculatorAddParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeDouble(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeDouble(value, 8);
  }
}

class CalculatorAddResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  double value = 0.0;

  CalculatorAddResponseParams() : super(kStructSize);

  static CalculatorAddResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorAddResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorAddResponseParams result = new CalculatorAddResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeDouble(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeDouble(value, 8);
  }
}

class CalculatorMultiplyParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  double value = 0.0;

  CalculatorMultiplyParams() : super(kStructSize);

  static CalculatorMultiplyParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorMultiplyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorMultiplyParams result = new CalculatorMultiplyParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeDouble(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeDouble(value, 8);
  }
}

class CalculatorMultiplyResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  double value = 0.0;

  CalculatorMultiplyResponseParams() : super(kStructSize);

  static CalculatorMultiplyResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CalculatorMultiplyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CalculatorMultiplyResponseParams result = new CalculatorMultiplyResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeDouble(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeDouble(value, 8);
  }
}
const int kCalculator_clear_name = 0;
const int kCalculator_add_name = 1;
const int kCalculator_multiply_name = 2;

abstract class Calculator implements core.Listener {
  static const String name = 'math::Calculator';
  CalculatorStub stub;

  Calculator(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CalculatorStub(endpoint);

  Calculator.fromHandle(core.MojoHandle handle) :
      stub = new CalculatorStub.fromHandle(handle);

  Calculator.fromStub(this.stub);

  Calculator.unbound() :
      stub = new CalculatorStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  Calculator get delegate => stub.delegate;
  set delegate(Calculator d) {
    stub.delegate = d;
  }
  Future<CalculatorClearResponseParams> clear([Function responseFactory = null]);
  Future<CalculatorAddResponseParams> add(double value,[Function responseFactory = null]);
  Future<CalculatorMultiplyResponseParams> multiply(double value,[Function responseFactory = null]);

}

class CalculatorProxy extends bindings.Proxy implements Calculator {
  CalculatorProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CalculatorProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CalculatorProxy.unbound() : super.unbound();

  String get name => Calculator.name;

  static CalculatorProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CalculatorProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCalculator_clear_name:
        var r = CalculatorClearResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kCalculator_add_name:
        var r = CalculatorAddResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kCalculator_multiply_name:
        var r = CalculatorMultiplyResponseParams.deserialize(
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
  Future<CalculatorClearResponseParams> clear([Function responseFactory = null]) {
    var params = new CalculatorClearParams();
    return sendMessageWithRequestId(
        params,
        kCalculator_clear_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<CalculatorAddResponseParams> add(double value,[Function responseFactory = null]) {
    var params = new CalculatorAddParams();
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kCalculator_add_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<CalculatorMultiplyResponseParams> multiply(double value,[Function responseFactory = null]) {
    var params = new CalculatorMultiplyParams();
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kCalculator_multiply_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class CalculatorStub extends bindings.Stub {
  Calculator _delegate = null;

  CalculatorStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CalculatorStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CalculatorStub.unbound() : super.unbound();

  static CalculatorStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CalculatorStub(endpoint);

  static const String name = Calculator.name;


  CalculatorClearResponseParams _CalculatorClearResponseParamsFactory(double value) {
    var result = new CalculatorClearResponseParams();
    result.value = value;
    return result;
  }
  CalculatorAddResponseParams _CalculatorAddResponseParamsFactory(double value) {
    var result = new CalculatorAddResponseParams();
    result.value = value;
    return result;
  }
  CalculatorMultiplyResponseParams _CalculatorMultiplyResponseParamsFactory(double value) {
    var result = new CalculatorMultiplyResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCalculator_clear_name:
        var params = CalculatorClearParams.deserialize(
            message.payload);
        return _delegate.clear(_CalculatorClearResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCalculator_clear_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kCalculator_add_name:
        var params = CalculatorAddParams.deserialize(
            message.payload);
        return _delegate.add(params.value,_CalculatorAddResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCalculator_add_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kCalculator_multiply_name:
        var params = CalculatorMultiplyParams.deserialize(
            message.payload);
        return _delegate.multiply(params.value,_CalculatorMultiplyResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCalculator_multiply_name,
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

  Calculator get delegate => _delegate;
      set delegate(Calculator d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


