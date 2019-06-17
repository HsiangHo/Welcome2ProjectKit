//
//  Welcome2ProjectUserChoice.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/17/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

public protocol W2PUserChoiceProtocol {
    func img() -> NSImage
    func title() -> String
    func subtitle() -> String
}

public protocol W2PUserInteractionChoiceProtocol {
    func action() -> ((Any) -> Void)?
}

// MARK: Welcome2ProjectUserChoiceObject
public class W2PUserChoiceObject {
    private var _img: NSImage
    private var _title: String
    private var _subtitle: String
    private var _action: ((Any?) -> Void)

    public init(img: NSImage, title: String, subtitle: String, action: @escaping ((Any) -> Void)) {
        _img = img
        _title = title
        _subtitle = subtitle
        _action = action
    }
}

// MARK: W2PUserChoiceObject Protocol
extension W2PUserChoiceObject: W2PUserChoiceProtocol {

    public func img() -> NSImage {
        return _img
    }

    public func title() -> String {
        return _title
    }

    public func subtitle() -> String {
        return _subtitle
    }
}

extension W2PUserChoiceObject: W2PUserInteractionChoiceProtocol {

    public func action() -> ((Any) -> Void)? {
        return _action
    }
}

// MARK: Welcome2ProjectFileObject
public class W2PFileObject: Codable {

    private var _img: NSImage?
    private var _imgName: String?
    private var _fileName: String?
    private var _filePath: URL

    enum CodingKeys: String, CodingKey {
        case imgName
        case fileName
        case filePath
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _imgName = try container.decode(String.self, forKey: .imgName)
        _fileName = try container.decode(String.self, forKey: .filePath)
        _filePath = try container.decode(URL.self, forKey: .filePath)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_img?.name(), forKey: .imgName)
        try container.encode(_fileName, forKey: .fileName)
        try container.encode(_filePath, forKey: .filePath)
    }

    public init(image: NSImage, fileName: String, filePath: URL) {
        _img = image
        _fileName = fileName
        _filePath = filePath
    }

    public init(imageName: String, fileName: String, filePath: URL) {
        _imgName = imageName
        _fileName = fileName
        _filePath = filePath
    }

    public init(fileName: String, filePath: URL) {
        _fileName = fileName
        _filePath = filePath
    }

    public init(filePath: URL) {
        _filePath = filePath
    }
}

// MARK: public methods
extension W2PFileObject {

    func fileName() -> String {
        return _fileName ?? _filePath.lastPathComponent
    }

    func filePath() -> URL {
        return _filePath
    }
}

// MARK: W2PFileObject Protocol
extension W2PFileObject: W2PUserChoiceProtocol {

    public func img() -> NSImage {
        var rslt = _img
        if nil == rslt, let imgName = _imgName {
            rslt = NSImage.init(named: imgName)
        }
        return rslt ?? NSWorkspace.shared.icon(forFile: _filePath.path)
    }

    public func title() -> String {
        return fileName()
    }

    public func subtitle() -> String {
        return filePath().path
    }
}
