//
//  GenericDataSource.swift
//  UI+AG
//
//  Created by Islam Elshazly on 12/13/18.
//

import UIKit
import Reusable

public enum TableState {
    case empty
    case filled
}

public final class GenericDataSource<Element, Cell: UITableViewCell, EmptyStateView>: NSObject, UITableViewDataSource where Cell: Reusable, EmptyStateView: UIView {
    
    public typealias CellHandlerType = (IndexPath, Cell) -> Void
    public typealias T = [Element]
    public var items: T {
        didSet {
            if items.isEmpty {
                state = .empty
            } else {
                state = .filled
            }
        }
    }
    public var emptyStatView: EmptyStateView?
    private var state: TableState?
    public var cellhandler: CellHandlerType?
    
    public init(array: T) {
        
        self.items = array
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("some thing went wrong ")
        }
        cellhandler?(indexPath, cell)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .empty?:
            guard let emptyStatView = EmptyStateView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: tableView.frame.height)) as? EmptyStateView else {
                fatalError("Error Load Empty state")
            }
            tableView.addSubview(emptyStatView)
        case .filled?:
            emptyStatView?.removeFromSuperview()
        default:
            break
        }
        return items.count
    }
}

