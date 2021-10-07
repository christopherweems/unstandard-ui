//
//  FileDocumentReadConfigurationProtocol.swift
//
//
//  Created by Christopher Weems on 9/10/20.
//

import struct SwiftUI.FileDocumentReadConfiguration
import UniformTypeIdentifiers

@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
@available(tvOS, unavailable)
public protocol FileDocumentReadConfigurationProtocol {
    /// The expected uniform type of the file contents.
    var contentType: UTType { get }
    
    /// The file wrapper containing the document content.
    var file: FileWrapper { get }
    
}

@available(macOS 11, iOS 14, watchOS 7, *)
@available(tvOS, unavailable)
extension FileDocumentReadConfiguration: FileDocumentReadConfigurationProtocol { }
